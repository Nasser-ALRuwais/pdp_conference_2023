import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/widgets/item_card.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text(
          "Info",
          style: TextStyle(
            color: Color(0xffededed),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        ItemCard(title: "Test Title", subtitle: "Short Description"),
        Divider(height: 20, indent: 15, endIndent: 15),
        ItemCard(
          title: "Test Title 2",
          subtitle: "Short Description",
          useGradient: true,
        ),
      ],
    );
  }
}
