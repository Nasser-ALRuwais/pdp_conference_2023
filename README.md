# pdp_conference_2023

This is the mobile application for the PDP Conference held in 2023.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Configuration
To ensure no compatibility issues in your side please ensure you have Flutter version 3.10.5 installed on your machine.

To connect to the backend you will need the below tools:

 - [npm](https://www.knowledgehut.com/blog/web-development/install-nodejs-npm-on-windows) this will be need to install the below
 - [Firebase-CLI](https://firebase.google.com/docs/cli)
 - [FlutterFire-CLI](https://firebase.flutter.dev/docs/cli/)

 After installing Firebase-CLI you need to run the command "firebase login" which will prompt you to login into the PDP conference google account. Before doing so contact me for the account credentials.

 After logging into firebase, navigate to the project's path and run the command "flutterfire configure" to configure firebase for your project. Go through the configuration process making sure to only select ios and android when it asks which platforms should you configuration support.

 The application should now run in your machine.