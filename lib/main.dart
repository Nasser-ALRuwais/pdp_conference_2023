import './screen/main_screen.dart';

import './screen/auth_screen.dart';
import './screen/chat.dart';
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
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 56, 106, 32)),
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
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        ChatScreen.routeName: (context) => const ChatScreen(),
      },
    );
  }
}
