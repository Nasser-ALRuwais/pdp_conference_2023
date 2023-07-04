// Create a main screen with a drawer widget. use the custom drawer widget created in the previous step.
// the main page will be the second page after the log in page so include a static routname variable.
// it will will have a centered text widget in top saying "PDP Conference 2023"
// and a drawer widget.
//
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main-screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('PDP Conference 2023'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('PDP Conference 2023'),
      ),
    );
  }
}
// Create a profile screen with a drawer widget. use the custom drawer widget created in the previous step.
// the profile page will be the third page after the log in page so include a static routname variable.
// it will will have a centered text widget in top saying "Profile"
// and a drawer widget.
//

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
