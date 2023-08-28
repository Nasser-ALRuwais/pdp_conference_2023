import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final authUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1a1531),
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7538A3),
                  Color(0xFF7C9EC9),
                  Color(0xFF7538A3)
                ],
                stops: [0, 0.5, 1],
                begin: AlignmentDirectional(1, -0.87),
                end: AlignmentDirectional(-1, 0.87),
              ),
            ),
            child: Text('Change Photo'),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text("${FirebaseAuth.instance.currentUser?.displayName}"),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text("${FirebaseAuth.instance.currentUser?.email}"),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1a1531),
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7538A3),
                  Color(0xFF7C9EC9),
                  Color(0xFF7538A3)
                ],
                stops: [0, 0.5, 1],
                begin: AlignmentDirectional(1, -0.87),
                end: AlignmentDirectional(-1, 0.87),
              ),
            ),
            child: Text('Change Password'),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff1a1531),
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF7538A3),
                  Color(0xFF7C9EC9),
                  Color(0xFF7538A3)
                ],
                stops: [0, 0.5, 1],
                begin: AlignmentDirectional(1, -0.87),
                end: AlignmentDirectional(-1, 0.87),
              ),
            ),
            child: Text('Change Department'),
          ),
        ],
      ),
    );
  }
}
