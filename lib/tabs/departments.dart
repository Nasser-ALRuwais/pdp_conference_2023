import 'package:flutter/material.dart';
import 'package:pdp_conference_2023/widgets/item_card.dart';

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ItemCard(
          title: "Corporate Applications Department",
          subtitle: "Short Description",
          useGradient: true,
        ),
        Divider(height: 20, indent: 15, endIndent: 15),
        ItemCard(
          title: "Computer Operations Department",
          subtitle:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet nisl urna. Mauris sagittis mauris tellus. Vivamus rutrum, orci pretium maximus facilisis, dolor nisi pulvinar elit, vitae faucibus velit quam eu neque. In odio dui, eleifend a finibus at, eleifend sed nisi. Nullam condimentum lectus id iaculis auctor. Aliquam lobortis lorem sed orci rutrum ultricies in suscipit nibh. Quisque pretium scelerisque tellus quis semper. Suspendisse elementum dignissim tellu",
          useGradient: true,
        ),
        Divider(height: 20, indent: 15, endIndent: 15),
        ItemCard(
          title: "Information Protection Department",
          subtitle: "Short Description",
          useGradient: true,
        ),
      ],
    );
  }
}
