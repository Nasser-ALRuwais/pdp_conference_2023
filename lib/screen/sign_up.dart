import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../firebase/auth.dart';
import '../firebase/random_colors.dart';
import '../firebase/user.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

FirebaseAuth _firebase = FirebaseAuth.instance;

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loading = false;
  final _key = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  var _enteredDepartment = '';
  var _enteredConfirmPassword = '';
  File? _selectedImage;
  int? selectedDept;

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
      body: SafeArea(
        child: Container(
          // iphoneQed (170:2098)
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ))
              : Column(
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
                      ],
                    ),
                    const Text(
                      'Registration',
                      style: TextStyle(
                        fontFamily: 'Spline Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Full Name",
                              prefixIcon: Icon(Icons.person_outline),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (value) => value!.trim().isEmpty
                                ? 'Please enter your name'
                                : null,
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              _enteredUsername = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: 2, color: const Color(0xffafb0b5)),
                              ),
                              errorStyle: const TextStyle(
                                fontFamily: "Spline Sans",
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email_outlined),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
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
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            hint: const Text('Department'),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
                              prefixIcon: Image.asset(
                                "assets/images/dept.png",
                                color: Colors.black,
                                height: 48,
                              ),
                            ),
                            value: selectedDept,
                            items: const [
                              DropdownMenuItem(
                                  value: 1,
                                  child: Text('Corporate Applications')),
                              DropdownMenuItem(
                                  value: 2, child: Text('Computer Operations')),
                              DropdownMenuItem(
                                  value: 3,
                                  child: Text('Information Protection')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedDept = value;
                              });
                            },
                          ),
                          // Autocomplete<String>(
                          //   fieldViewBuilder: (context, textEditingController,
                          //           focusNode, onFieldSubmitted) =>
                          //       TextFormField(
                          //     focusNode: focusNode,
                          //     controller: textEditingController,
                          //     decoration: InputDecoration(
                          //       labelText: "Department",
                          //       prefixIcon: Image.asset(
                          //         "assets/images/dept.png",
                          //         color: Colors.black,
                          //       ),
                          //       floatingLabelBehavior:
                          //           FloatingLabelBehavior.never,
                          //     ),
                          //     validator: (value) {
                          //       if (value == null || value.trim().isEmpty) {
                          //         return 'Please enter your department';
                          //       } else if (!_departments.contains(value)) {
                          //         return 'Please enter a valid department';
                          //       }

                          //       return null;
                          //     },
                          //     keyboardType: TextInputType.name,
                          //     textCapitalization: TextCapitalization.sentences,
                          //   ),
                          //   optionsBuilder:
                          //       (TextEditingValue textEditingValue) {
                          //     if (textEditingValue.text == '') {
                          //       return const Iterable<String>.empty();
                          //     }
                          //     return _departments.where((String option) {
                          //       return option.contains(textEditingValue.text);
                          //     });
                          //   },
                          //   onSelected: (String selection) {
                          //     debugPrint('You just selected $selection');
                          //     _enteredDepartment = selection;
                          //   },
                          // ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
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
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
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
                        ],
                      ),
                    ),
                    Container(
                      // frame38767K (170:2071)
                      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                          height: 49,
                          child: Container(
                            // buttonoGd (170:2072)
                            width: double.infinity,
                            height: double.infinity,
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
                            child: const Center(
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Spline Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  letterSpacing: -0.16,
                                  color: Color(0xffffffff),
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
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'Spline Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: Color(0xffededed),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/sign-in');
                            },
                            child: const Text(
                              "Login",
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
