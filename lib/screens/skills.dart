import 'package:flutter/material.dart';
import 'package:flutter_devicon/flutter_devicon.dart';
import 'package:portfolio/utils/skills_icons.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '   Skills',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 60,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Wrap(
              children: [
                SkillsIcons(
                  skillIconName: FlutterDEVICON.flutter_plain,
                  skillIconColor: Colors.lightBlue,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.java_plain_wordmark,
                  skillIconColor: Colors.orange,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.python_plain_wordmark,
                  skillIconColor: Colors.yellow,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.react_original_wordmark,
                  skillIconColor: Colors.orange,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.nodejs_plain_wordmark,
                  skillIconColor: Colors.green,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.html5_plain_wordmark,
                  skillIconColor: Colors.red,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.css3_plain_wordmark,
                  skillIconColor: Colors.blue,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.javascript_plain,
                  skillIconColor: Colors.yellow,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.github_original_wordmark,
                  skillIconColor: Colors.black,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.git_plain_wordmark,
                  skillIconColor: Colors.blue,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.c_line,
                  skillIconColor: Colors.green,
                ),
                SkillsIcons(
                  skillIconName: FlutterDEVICON.cplusplus_plain,
                  skillIconColor: Colors.lightBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
