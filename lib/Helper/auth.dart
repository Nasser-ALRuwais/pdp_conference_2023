import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pdp_conference_2023/Helper/user.dart';

final _firebase = FirebaseAuth.instance;

class Auth {
  const Auth({required this.user});

  final Users user;

  Future<String> signUp() async {
    final String enteredEmail = user.email;
    final String enteredPassword = user.password;
    final String enteredUsername = user.username;
    final String enteredDepartment = user.department;
    final int enteredColor = user.color.value;
    final File? selectedImage = user.selectedImage;
    try {
      //backend call
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: enteredEmail, password: enteredPassword);

      //upload the image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("user_images")
          .child('${userCredentials.user!.uid}.jpg');
      await storageRef.putFile(selectedImage!);
      //get the image url from Storage
      final imageUrl = await storageRef.getDownloadURL();

      //add the new user to the database
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set(
        {
          'username': enteredUsername,
          'email': enteredEmail,
          'image_url': imageUrl,
          'color': enteredColor,
          'department': enteredDepartment,
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "Email is already in use";
      } else if (e.code == 'invalid-email') {
        return "Email is invalid";
      } else if (e.code == 'operation-not-allowed') {
        return "Email is not validated";
      } else if (e.code == 'weak-password') {
        return "Password is weak";
      }
    }
    return 'success';
  }

  Future<String> signIn() async {
    final String enteredEmail = user.email;
    final String enteredPassword = user.password;

    try {
      await _firebase.signInWithEmailAndPassword(
        email: enteredEmail,
        password: enteredPassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        return "Email is already in use";
      } else if (e.code == 'invalid-email') {
        return "Email is invalid";
      } else if (e.code == 'user-not-found') {
        return "Email is not validated";
      } else if (e.code == 'wrong-password') {
        return "Password is wrong";
      }
    }
    return 'success';
  }
}
