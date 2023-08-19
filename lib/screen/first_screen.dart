import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    print(fem);
    double ffem = fem * 0.97;
    return Container(
      // iphone9DT (170:2143)
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 187 * fem,
            height: 158.63 * fem,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          SizedBox(
            width: 198 * fem,
            height: 80 * fem,
            child: Text(
              'D&IT PDP\nConference 2023',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Spline Sans',
                fontSize: 25 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.2 * ffem / fem,
                color: const Color(0xffededed),
              ),
            ),
          ),
          Container(
            // buttonKp5 (170:2168)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 15 * fem),
            child: ElevatedButton(
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
                height: 49 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xff7c9ec9),
                  borderRadius: BorderRadius.circular(13 * fem),
                  gradient: const LinearGradient(
                    begin: Alignment(0.838, 0),
                    end: Alignment(-0, 1),
                    colors: <Color>[Color(0x997538a3), Color(0x997538a3)],
                    stops: <double>[0, 1],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Spline Sans',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
              height: 49 * fem,
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(13 * fem),
              ),
              child: Center(
                child: Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Spline Sans',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
