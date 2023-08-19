import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/screen/sign_in.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.08, -1.00),
          end: Alignment(-0.08, 1),
          colors: [Color(0xFF351A33), Color(0x00351A33)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -20,
            top: -75,
            child: SizedBox(
              width: 395,
              height: 895.08,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 895.08,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.57),
                        child: SizedBox(
                          width: 342.08,
                          height: 197.50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: -0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 98.75,
                    top: 895.08,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.57),
                        child: SizedBox(
                          width: 342.08,
                          height: 197.50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: -0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 667.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 667.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 342.08,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.57),
                        child: SizedBox(
                          width: 342.08,
                          height: 197.50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: -0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 98.75,
                    top: 342.08,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.57),
                        child: SizedBox(
                          width: 342.08,
                          height: 197.50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: -0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: -228.05,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(-1.05),
                                  child: Container(
                                    width: 131.67,
                                    height: 131.67,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(0.00, -1.00),
                                        end: const Alignment(0, 1),
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 114.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 114.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 114.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 197.50,
                    top: 667.03,
                    child: Opacity(
                      opacity: 0.01,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.05),
                        child: Container(
                          width: 131.67,
                          height: 131.67,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 469,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 343,
                  height: 49,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(1.00, -0.09),
                      end: Alignment(-1, 0.09),
                      colors: [Color(0xFF7538A3), Color(0xAA7538A3)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Spline Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      print("sign up");
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 343,
                  height: 49,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Spline Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SignInScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 69,
            top: 136,
            child: SizedBox(
              width: 238,
              height: 240,
              child: Stack(
                children: [
                  Positioned(
                    left: 23,
                    top: 0,
                    child: Container(
                      width: 206.38,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    top: 168,
                    child: Text(
                      'D&IT PDP\nConference 2023',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFEDEDED),
                        fontSize: 30,
                        fontFamily: 'Spline Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 778,
            child: Container(
              width: 375,
              height: 34,
              padding: const EdgeInsets.only(
                top: 21,
                left: 121,
                right: 120,
                bottom: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 134,
                    height: 5,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
