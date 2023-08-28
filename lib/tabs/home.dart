import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/widgets/about_tab.dart';
import 'package:pdp_conference_2023/widgets/agenda_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> with SingleTickerProviderStateMixin {
  int active = 1;

  late TabController test;
  final authUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    test = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            "Hi, ${authUser?.displayName} 👋",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xffededed),
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: TabBar(
            dividerColor: Theme.of(context).colorScheme.primary,
            controller: test,
            labelColor: Colors.white,
            indicator: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white, width: 2)),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              setState(() {
                active = index;
              });
            },
            tabs: [
              Tab(
                child: Text("About"),
              ),
              Tab(
                child: Text("Agenda"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: test,
                children: [About(), Agenda()]),
          ),
        )
      ],
    );
  }
}
