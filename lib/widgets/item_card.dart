import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ItemCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool useGradient;
  const ItemCard(
      {super.key,
      this.useGradient = false,
      required this.title,
      required this.subtitle});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: widget.useGradient
            ? const LinearGradient(
                colors: [
                  Color(0xFF7538A3),
                  Color(0xFF7C9EC9),
                  Color(0xFF7538A3)
                ],
                stops: [0, 0.5, 1],
                begin: AlignmentDirectional(1, -0.87),
                end: AlignmentDirectional(-1, 0.87),
              )
            : null,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: ExpandableNotifier(
        initialExpanded: false,
        child: ExpandablePanel(
          header: Text(
            widget.title,
            style: widget.useGradient
                ? const TextStyle(color: Colors.white, fontSize: 16)
                : const TextStyle(fontSize: 16),
          ),
          collapsed: Text(
            widget.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.useGradient
                ? const TextStyle(color: Colors.white)
                : null,
          ),
          expanded: Text(
            widget.subtitle,
            style: widget.useGradient
                ? const TextStyle(color: Colors.white)
                : null,
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: true,
            tapBodyToCollapse: true,
          ),
        ),
      ),
    );
  }
}
