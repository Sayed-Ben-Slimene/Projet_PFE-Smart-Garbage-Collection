import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.title, required this.tapEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: const Color.fromARGB(0, 14, 82, 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 25, 25, 25),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ),
    );
  }
}
