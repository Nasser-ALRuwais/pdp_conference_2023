import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/screen/auth_screen.dart';
import 'package:pdp_conference_2023/widgets/authentication.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 0.97;
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // group2579wuK (170:1674)
          margin: EdgeInsets.fromLTRB(10 * fem, 15 * fem, 0 * fem, 0 * fem),

          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 60,
                height: 40,
              ),
              Text(
                'D&IT PDP\nConference 2023',
                style: TextStyle(
                  fontFamily: 'Spline Sans',
                  fontSize: 10 * ffem,
                  fontWeight: FontWeight.w600,
                  // height: 1.2 * ffem / fem,
                  color: const Color(0xffededed),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.28,
        ),
        IconButton(
          onPressed: () {
            //TODO navigate to the profile screen
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
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, AuthScreen.routeName);
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

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
