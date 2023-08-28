import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/screen/auth_screen.dart';
import 'package:pdp_conference_2023/widgets/profile.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 60,
          height: 40,
        ),
        const Text(
          'D&IT PDP\nConference 2023',
          style: TextStyle(
            fontFamily: 'Spline Sans',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            // height: 1.2 * ffem / fem,
            color: Color(0xffededed),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                ),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6),
                clipBehavior: Clip.hardEdge,
                builder: (builder) {
                  return const ProfileScreen();
                });
          },
          icon: const Icon(Icons.person),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            highlightColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Center(child: Text('Confirm Logout')),
                titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
                content: const Text('Are you sure you want to logout?',
                    textAlign: TextAlign.center),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(100, 40),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                          context, AuthScreen.routeName);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple),
                      minimumSize: MaterialStateProperty.all(
                        const Size(100, 40),
                      ),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          },
          icon: const Icon(Icons.nfc),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            highlightColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
