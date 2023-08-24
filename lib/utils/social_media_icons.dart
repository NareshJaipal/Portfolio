import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatefulWidget {
  final IconData iconName;
  final String socialUrl;
  const SocialMediaIcons(
      {super.key, required this.iconName, required this.socialUrl});

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(widget.socialUrl);
        launchUrl(url);
      },
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
