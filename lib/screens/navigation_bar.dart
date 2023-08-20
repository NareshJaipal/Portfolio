import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Flutter Developer'),
        TextButton(
          onPressed: () {},
          child: const Text('Home'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('About'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Projects'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Contact'),
        ),
      ],
    );
  }
}
