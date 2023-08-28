// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';

import '../firebase/auth.dart';
import '../firebase/random_colors.dart';
import '../firebase/user.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _loading = false;
  final _key = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordHidden = true;

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Container(
          // iphonekZw (170:2053)
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xff1a1531),
            borderRadius: BorderRadius.circular(1),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          // pdpconferencebrandimage13FQD (170:2094)
                          width: 153,
                          height: 129,
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),
                        ),
                        // Center(
                        //   // ditpdpconference2023B2y (170:2093)
                        //   child: Container(
                        //     margin:
                        //         const EdgeInsets.only(right: 20, bottom: 20),
                        //     width: double.infinity,
                        //     constraints: BoxConstraints(
                        //       maxWidth: 150,
                        //     ),
                        //     child: Text(
                        //       'D&IT PDP\nConference 2023',
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //         fontFamily: 'Spline Sans',
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w600,
                        //         color: const Color(0xffededed),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 72),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Spline Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(height: 24),
                    Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains("@aramco")) {
                                  return 'Please enter a valid Aramco Email address';
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
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                          ],
                        )),
                    Container(
                      // frame38767K (170:2071)
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                        child: Container(
                          // buttonoGd (170:2072)
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
                              )),
                          child: Center(
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Spline Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.16,
                                color: const Color(0xffffffff),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
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
      ),
    );
  }
}
