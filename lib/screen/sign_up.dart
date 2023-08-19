import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Helper/auth.dart';
import '../Helper/random_colors.dart';
import '../Helper/user.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

FirebaseAuth _firebase = FirebaseAuth.instance;

class _SignUpScreenState extends State<SignUpScreen> {
  static const List<String> _departments = ['Cad', 'Cod', 'Ipd'];
  bool _loading = false;
  final _key = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  var _enteredDepartment = '';
  var _enteredConfirmPassword = '';
  File? _selectedImage;
  double fem = 1;
  double ffem = 1 * 0.97;

  void _isSubmit() async {
    final isValid = _key.currentState!.validate();
    _key.currentState!.save();
    if (_enteredPassword != _enteredConfirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Passwords do not match'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }
    if (!isValid) {
      return;
    }

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

    final result = await auth.signUp();
    setState(() {
      _loading = false;
    });
    if (result == 'success' &&
        context.mounted &&
        _firebase.currentUser != null) {
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
      body: Container(
        // iphoneQed (170:2098)
        padding: EdgeInsets.fromLTRB(16 * fem, 86 * fem, 16 * fem, 72 * fem),
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
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group46MiH (170:2126)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 157 * fem, 30 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // headlinefys (170:2127)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 7 * fem),
                          child: Text(
                            'Registration ',
                            style: TextStyle(
                              fontFamily: 'Spline Sans',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.36 * fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              // group591AZ (170:2130)
                              height: 49,
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffafb0b5)),
                                borderRadius: BorderRadius.circular(13 * fem),
                                color: const Color(0xffffffff),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(
                                    fontFamily: "Spline Sans",
                                  ),
                                  labelText: "Full Name",
                                  prefixIcon: Icon(Icons.person_outline),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                ),
                                validator: (value) => value!.trim().isEmpty
                                    ? 'Please enter your name'
                                    : null,
                                keyboardType: TextInputType.name,
                                autocorrect: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  _enteredUsername = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16 * fem,
                        ),
                        Container(
                          // group60sMB (170:2131)
                          height: 49,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffafb0b5)),
                            borderRadius: BorderRadius.circular(13 * fem),
                            color: const Color(0xffffffff),
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
                                  !value.contains("@") ||
                                  !value.contains("@aramco.com")) {
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
                        ),
                        SizedBox(
                          height: 16 * fem,
                        ),
                        Container(
                          // group60sMB (170:2131)
                          height: 49,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffafb0b5)),
                            borderRadius: BorderRadius.circular(13 * fem),
                            color: const Color(0xffffffff),
                          ),
                          child: Autocomplete<String>(
                            fieldViewBuilder: (context, textEditingController,
                                    focusNode, onFieldSubmitted) =>
                                TextFormField(
                              focusNode: focusNode,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                labelText: "Department",
                                prefixIcon: Image.asset(
                                  "assets/images/dept.png",
                                  color: Colors.black,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your department';
                                } else if (!_departments.contains(value)) {
                                  return 'Please enter a valid department';
                                }

                                return null;
                              },
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return _departments.where((String option) {
                                return option.contains(textEditingValue.text);
                              });
                            },
                            onSelected: (String selection) {
                              debugPrint('You just selected $selection');
                              _enteredDepartment = selection;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16 * fem,
                        ),
                        Container(
                          // group60sMB (170:2131)
                          height: 49,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffafb0b5)),
                            borderRadius: BorderRadius.circular(13 * fem),
                            color: const Color(0xffffffff),
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
                        SizedBox(
                          height: 16 * fem,
                        ),
                        Container(
                          // group60sMB (170:2131)
                          height: 49,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffafb0b5)),
                            borderRadius: BorderRadius.circular(13 * fem),
                            color: const Color(0xffffffff),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Confirm Password",
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
                              _enteredConfirmPassword = newValue!;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16 * fem,
                        ),
                      ],
                    ),
                  ),
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
                ],
              ),
      ),
    );
  }
}
