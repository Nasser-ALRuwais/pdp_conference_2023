import 'dart:io';

import '../Helper/randomColors.dart';

import '../widgets/user_image_picker.dart';

import 'package:flutter/material.dart';
import '../Helper/auth.dart';
import '../Helper/user.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  bool _loading = false;
  final _key = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  var _enteredDepartment = '';
  var _status = '';
  File? _selectedImage;

  void _isSubmit() async {
    final isValid = _key.currentState!.validate();

    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }

    if (isValid) {
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

      if (_isLogin) {
        _status = await auth.signIn();
        setState(() {
          _loading = false;
        });
      } else {
        _status = await auth.signUp();
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset("./assets/images/chat.png"),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _loading
                        ? const CircularProgressIndicator()
                        : Form(
                            key: _key,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (!_isLogin)
                                  UserImagePicker(
                                    onPickImage: (pickedImage) {
                                      _selectedImage = pickedImage;
                                    },
                                  ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
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
                                if (!_isLogin)
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: "Username"),
                                    enableSuggestions: false,
                                    onSaved: (newValue) {
                                      _enteredUsername = newValue!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 4) {
                                        return 'Please enter a valid username (at least 4 characters)';
                                      }
                                      return null;
                                    },
                                  ),
                                //check if the user is signing up from the property _isLogin. if he is signing up, show a dropdown menu to choose a department

                                if (!_isLogin)
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Department",
                                    ),
                                    value: _enteredDepartment.isEmpty
                                        ? null
                                        : _enteredDepartment,
                                    items: const [
                                      DropdownMenuItem(
                                        value: "Computer Science",
                                        child: Text("Computer Science"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Information Systems",
                                        child: Text("Information Systems"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Software Engineering",
                                        child: Text("Software Engineering"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Computer Engineering",
                                        child: Text("Computer Engineering"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Computer Information Systems",
                                        child: Text(
                                            "Computer Information Systems"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      _enteredDepartment = value.toString();
                                    },
                                  ),

                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    _enteredPassword = newValue!;
                                  },
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  onPressed: _isSubmit,
                                  child: Text(_isLogin ? "Log in" : "Sign up"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(_isLogin
                                      ? "Create an account"
                                      : "Already have an account?"),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
