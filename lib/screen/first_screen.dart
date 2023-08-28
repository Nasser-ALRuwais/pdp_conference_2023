import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // iphone9DT (170:2143)
        decoration: const BoxDecoration(
          color: Color(0xff1a1531),
          gradient: LinearGradient(
            begin: Alignment(-0.901, -1.496),
            end: Alignment(-0, 1),
            colors: <Color>[Color(0xff351a33), Color(0x00351a33)],
            stops: <double>[0, 1],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 187,
                height: 158.63,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              const SizedBox(
                width: 198,
                height: 80,
                child: Text(
                  'D&IT PDP\nConference 2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Spline Sans',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffededed),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign-up');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 49,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c9ec9),
                    borderRadius: BorderRadius.circular(13),
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
                  child: const Center(
                    child: Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Spline Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                // button8Fj (170:2169)
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign-in');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black45,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 49,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Center(
                    child: Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Spline Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
