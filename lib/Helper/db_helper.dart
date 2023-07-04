import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addMessageToDb(Map<String, dynamic> messageInfo) async {
  await _firestore.collection("chats").add(messageInfo);
}
