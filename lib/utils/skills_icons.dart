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
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isHovering ? Colors.cyan.shade400 : Colors.white,
          border: Border.all(
              color: isHovering ? Colors.cyan.shade400 : Colors.grey),
          borderRadius: isHovering
              ? BorderRadius.circular(25)
              : BorderRadius.circular(15),
        ),
        padding:
            isHovering ? const EdgeInsets.all(15) : const EdgeInsets.all(20),
        margin: MediaQuery.of(context).size.width < 400
            ? const EdgeInsets.all(10)
            : MediaQuery.of(context).size.width < 650
                ? const EdgeInsets.all(20)
                : MediaQuery.of(context).size.width < 930
                    ? const EdgeInsets.all(30)
                    : const EdgeInsets.all(40),
        child: Icon(
          widget.skillIconName,
          size: isHovering ? 100 : 90,
          color: widget.skillIconColor,
        ),
      ),
    );
  }
}
