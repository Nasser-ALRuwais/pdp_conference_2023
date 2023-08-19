import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/widgets/main%20screen%20widgets/main_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main-screen1';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser;

    double fem = 1;
    double ffem = 0.97;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        // iphonekZw (170:2053)
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff1a1531),
          borderRadius: BorderRadius.circular(1 * fem),
          gradient: const LinearGradient(
            begin: Alignment(-0.901, -1.496),
            end: Alignment(-0, 1),
            colors: <Color>[Color(0xff351a33), Color(0x00351a33)],
            stops: <double>[0, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const MainAppBar(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                "Hi, ${authUser?.displayName} 👋",
                style: TextStyle(
                  fontFamily: 'Spline Sans',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffededed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
