import 'package:flutter/material.dart';

class SkillsIcons extends StatefulWidget {
  final IconData skillIconName;
  final Color skillIconColor;
  const SkillsIcons(
      {super.key, required this.skillIconName, required this.skillIconColor});

  @override
  State<SkillsIcons> createState() => _SkillsIconsState();
}

class _SkillsIconsState extends State<SkillsIcons> {
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
        duration: const Duration(microseconds: 300),
        decoration: BoxDecoration(
          color: isHovering ? Colors.cyan.shade400 : Colors.white,
          border: Border.all(
              color: isHovering ? Colors.cyan.shade400 : Colors.grey),
          borderRadius: isHovering
              ? BorderRadius.circular(20)
              : BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        margin: MediaQuery.of(context).size.width < 400
            ? const EdgeInsets.all(10)
            : MediaQuery.of(context).size.width < 650
                ? const EdgeInsets.all(20)
                : MediaQuery.of(context).size.width < 930
                    ? const EdgeInsets.all(30)
                    : const EdgeInsets.all(40),
        child: Icon(
          widget.skillIconName,
          size: isHovering ? 110 : 90,
          color: widget.skillIconColor,
        ),
      ),
    );
  }
}
