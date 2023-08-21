import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIcons extends StatefulWidget {
  final IconData iconName;
  const SocialMediaIcons({super.key, required this.iconName});

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isHovering ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isHovering ? Colors.grey : Colors.white),
        ),
        padding: const EdgeInsets.all(4),
        child: FaIcon(widget.iconName),
      ),
    );
  }
}
