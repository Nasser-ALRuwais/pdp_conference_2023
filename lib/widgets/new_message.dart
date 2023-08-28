import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose(); // you always need to dispose of controllers
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus(); // removes the keyboard from the screen
    _messageController.clear(); // clear textfield
    final user =
        FirebaseAuth.instance.currentUser!; // get the current logged in user

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get(); //get the current user's info from database

    FirebaseFirestore.instance.collection("chat").add({
      'text': enteredMessage,
      'username': userData.data()!['username'],
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'imageUrl': userData.data()!['image_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
                labelText: 'Send a message...',
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never),
            controller: _messageController,
          ),
        ),
        IconButton(
          color: Theme.of(context).colorScheme.surface,
          onPressed: _submitMessage,
          icon: const Icon(
            Icons.send,
          ),
        ),
      ],
    );
  }
}
