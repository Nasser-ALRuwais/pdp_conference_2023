import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addMessageToDb(Map<String, dynamic> messageInfo) async {
  await _firestore.collection("chats").add(messageInfo);
}

// create a function to get the color of the user
Future<int> getColor() async {
  final user = FirebaseAuth.instance.currentUser;
  final userData =
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
  return userData.data()!['color'];
}
