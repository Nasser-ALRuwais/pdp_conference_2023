import 'dart:io';

import 'package:flutter/material.dart';

import '../Helper/auth.dart';
import '../Helper/random_colors.dart';
import '../Helper/user.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _loading = false;
  final _key = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  var _enteredDepartment = '';

  File? _selectedImage;

  void _isSubmit() async {
    final isValid = _key.currentState!.validate();

    if (!isValid) {
      return;
    }

    _key.currentState!.save();
    setState(() {
      _loading = true;
    });

    final Users user = Users(
      email: _enteredEmail,
      password: _enteredPassword,
      username: _enteredUsername,
      selectedImage: _selectedImage,
      color: RandomColors.getRandomColor(),
      department: _enteredDepartment,
    );
    final auth = Auth(user: user);

    final result = await auth.signIn();
    setState(() {
      _loading = false;
    });
    print(result);
    if (result == 'success' && context.mounted) {
      Navigator.of(context).pushReplacementNamed('/main-screen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 1 * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        // iphonekZw (170:2053)
        padding: EdgeInsets.fromLTRB(16 * fem, 71 * fem, 16 * fem, 73 * fem),
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
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // group2581Xj7 (170:2091)

                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // pdpconferencebrandimage13FQD (170:2094)
                          width: 153 * fem,
                          height: 129 * fem,
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),
                        ),
                        Center(
                          // ditpdpconference2023B2y (170:2093)
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 150 * fem,
                            ),
                            child: Text(
                              'D&IT PDP\nConference 2023',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Spline Sans',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffededed),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // headline3qs (170:2067)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 263 * fem, 21 * fem),
                    child: Text(
                      'Login ',
                      style: TextStyle(
                        fontFamily: 'Spline Sans',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3999999364 * ffem / fem,
                        letterSpacing: -0.36 * fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Form(
                      key: _key,
                      child: Column(
                        children: [
                          Container(
                            height: 49,
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains("@")) {
                                  return 'Please enter a valid Email address';
                                }

                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 49,
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredPassword = newValue!;
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(
                    // frame38767K (170:2071)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 50 * fem, 0 * fem, 0 * fem),
                    child: ElevatedButton(
                      onPressed: _isSubmit,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        padding: EdgeInsets.zero,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 49 * fem,
                        child: Container(
                          // buttonoGd (170:2072)
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c9ec9),
                            borderRadius: BorderRadius.circular(13 * fem),
                            gradient: const LinearGradient(
                              begin: Alignment(0.838, 0),
                              end: Alignment(-0, 1),
                              colors: <Color>[
                                Color(0x997538a3),
                                Color(0x997538a3)
                              ],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Spline Sans',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                letterSpacing: -0.16 * fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: TextStyle(
                            fontFamily: 'Spline Sans',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.16 * fem,
                            color: const Color(0xffededed),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(0),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/sign-up');
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontFamily: 'Spline Sans',
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff83e6e6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
