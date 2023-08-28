import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/tabs/departments.dart';
import 'package:pdp_conference_2023/tabs/home.dart';
import 'package:pdp_conference_2023/tabs/timeline.dart';
import 'package:pdp_conference_2023/tabs/map.dart';
import 'package:pdp_conference_2023/widgets/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int active = 1;
  late TabController test;

  @override
  void initState() {
    super.initState();
    test = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
              title: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: MainAppBar(),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary),
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [Home(), Departments(), Timeline(), Map()],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            color: const Color.fromARGB(255, 152, 67, 146),
            elevation: 0,
            child: Container(
              decoration: const BoxDecoration(
                // gradient: const LinearGradient(
                //   begin: Alignment(-0.901, -1.496),
                //   end: Alignment(-0, 1),
                //   colors: <Color>[Color(0xff351a33), Color(0x00351a33)],
                //   stops: <double>[0, 1],
                // ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7538A3),
                    Color(0xFF7C9EC9),
                    Color(0xFF7538A3)
                  ],
                  stops: [0, 0.5, 1],
                  begin: AlignmentDirectional(1, -0.87),
                  end: AlignmentDirectional(-1, 0.87),
                ),
              ),
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                dividerColor: Theme.of(context).colorScheme.primary,
                onTap: (index) {
                  if (mounted)
                    setState(() {
                      active = index;
                    });
                },
                tabs: [
                  Tab(
                    icon: Image.asset("assets/images/home.png",
                        color: Colors.white, height: 24),
                    child: const Text("Home",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Tab(
                    icon: Image.asset("assets/images/departments.png",
                        color: Colors.white, height: 24),
                    child: const Text("Departments",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Tab(
                    icon: Image.asset("assets/images/timeline.png",
                        color: Colors.white, height: 24),
                    child: const Text(
                      "Timeline",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Tab(
                    icon: Image.asset("assets/images/map.png",
                        color: Colors.white, height: 24),
                    child: const Text("Booth Map",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
