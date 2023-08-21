import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/social_media_icons.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcons(iconName: FontAwesomeIcons.facebook),
              SizedBox(width: 20),
              SocialMediaIcons(iconName: FontAwesomeIcons.github),
              SizedBox(width: 20),
              SocialMediaIcons(iconName: FontAwesomeIcons.twitter),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Naresh Jaipal",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
