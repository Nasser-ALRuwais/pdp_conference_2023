import 'package:pdp_conference_2023/screen/sign_in.dart';
import 'package:pdp_conference_2023/screen/sign_up.dart';

import './screen/main_screen.dart';
import './screen/auth_screen.dart';
import './screen/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData(fontFamily: "Spline Sans").copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF020F29),
          onPrimary: Color(0xFFFB8B24),
          secondary: Color(0xFFFB8B24),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xFF020F29),
          onBackground: Color(0xFF020F29),
          surface: Color(0xFFFFF9E8),
          onSurface: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: Color(0xffafb0b5)),
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: Color(0xffafb0b5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: Color(0xffafb0b5)),
          ),
        ),

        //ColorScheme.fromSeed(seedColor: const Color.fromRGBO(2, 15, 41, 1.0)),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          return snapshot.data != null
              ? const MainScreen()
              : const AuthScreen();
        },
      ),
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
      },
    );
  }
}
