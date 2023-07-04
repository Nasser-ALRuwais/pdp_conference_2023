import '../widgets/drawer.dart';

import '../widgets/chat_message.dart';
import '../widgets/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');
    await fcm.getToken(); //get the address of this specific device
  }

  @override
  void initState() {
    setupPushNotification();
    super.initState();
    //Below is for push notifications
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text("FlutterChat"),
        ),
        body: const Column(
          children: [
            Expanded(child: ChatMessage()),
            NewMessage(),
          ],
        ));
  }
}
