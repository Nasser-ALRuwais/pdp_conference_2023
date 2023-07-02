//create a user class that has 6 properties: email, username, selected image (File), password, color (Color), and department.
//Create getters for all properties.
//import needed packages
import 'dart:io';
import 'dart:ui';

class Users {
  const Users({
    required this.email,
    required this.username,
    required this.selectedImage,
    required this.password,
    required this.color,
    required this.department,
  });

  final String email;
  final String username;
  final File? selectedImage;
  final String password;
  final Color color;
  final String department;

  String get getEmail => email;
  String get getUsername => username;
  File? get getSelectedImage => selectedImage;
  String get getPassword => password;
  Color get getColor => color;
  String get getDepartment => department;
}
