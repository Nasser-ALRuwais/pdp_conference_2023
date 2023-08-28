import '../widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    //get the current logged in user
    final authenticatedUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
                "The timeline is empty!\nStart by sending your own thoughts"),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
                "An error has been encountered: ${snapshot.error.toString()}"),
          );
        }

        final loadedMessages = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40),
          reverse: true,
          itemBuilder: (context, index) {
            final chatMessage =
                loadedMessages[index].data(); //get chat message data
            final nextChatMessage = index + 1 <
                    loadedMessages
                        .length //check if there is a next chat message
                ? loadedMessages[index + 1].data()
                : null;

            //get the user ID for the current message and the next one and compare them to check if they came from the same sender
            final currentMessageUserId = chatMessage["userId"];
            final nextMessageUserId =
                nextChatMessage != null ? nextChatMessage["userId"] : null;
            final nextUserIsSame = currentMessageUserId == nextMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser!.uid == currentMessageUserId,
                userId: authenticatedUser.uid == currentMessageUserId
                    ? currentMessageUserId.toString()
                    : authenticatedUser.uid,
              ); //compare the logged in user ID with the current chat message user ID
            } else {
              return MessageBubble.first(
                userImage: chatMessage['imageUrl'],
                username: chatMessage['username'],
                message: chatMessage['text'],
                isMe: authenticatedUser!.uid == currentMessageUserId,
                userId: authenticatedUser.uid == currentMessageUserId
                    ? currentMessageUserId.toString()
                    : authenticatedUser.uid,
              );
            }
          },
          itemCount: loadedMessages.length,
        );
      },
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
    );
  }
}
