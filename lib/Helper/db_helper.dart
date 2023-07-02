import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addMessageToDb(Map<String, dynamic> messageInfo) async {
  print(_firestore.app.name);

  await _firestore
      .collection("chatrooms")
      .doc()
      .collection("chats")
      .add(messageInfo);
}
