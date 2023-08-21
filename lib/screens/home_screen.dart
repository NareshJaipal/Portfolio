import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).size.width < 350
          ? const EdgeInsets.symmetric(vertical: 10)
          : MediaQuery.of(context).size.width < 500
              ? const EdgeInsets.symmetric(vertical: 30)
              : MediaQuery.of(context).size.width < 900
                  ? const EdgeInsets.symmetric(vertical: 60)
                  : const EdgeInsets.symmetric(vertical: 80),
      //
      width: MediaQuery.of(context).size.width,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: [
            ProfilePicture(),
            BIO(),
          ],
        ),
      ),
    );
  }
}

class BIO extends StatelessWidget {
  const BIO({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 900
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width < 1600
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, It's",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width < 500
                    ? MediaQuery.of(context).size.width * 0.07
                    : MediaQuery.of(context).size.width < 900
                        ? MediaQuery.of(context).size.width * 0.06
                        : MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Text(
            'Naresh Jaipal',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width < 500
                    ? MediaQuery.of(context).size.width * 0.1
                    : MediaQuery.of(context).size.width < 900
                        ? MediaQuery.of(context).size.width * 0.08
                        : MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Text(
                "And I'm a ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width < 500
                        ? MediaQuery.of(context).size.width * 0.053
                        : MediaQuery.of(context).size.width < 900
                            ? MediaQuery.of(context).size.width * 0.047
                            : MediaQuery.of(context).size.width * 0.023,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),

              //
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width < 500
                        ? MediaQuery.of(context).size.width * 0.055
                        : MediaQuery.of(context).size.width < 900
                            ? MediaQuery.of(context).size.width * 0.05
                            : MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Front-end Web Developer'),
                    TypewriterAnimatedText('Flutter Developer'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.',
            style: TextStyle(
              // fontSize: MediaQuery.of(context).size.width * 0.01,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < 500
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width < 900
              ? MediaQuery.of(context).size.width * 0.7
              : MediaQuery.of(context).size.width < 1600
                  ? MediaQuery.of(context).size.width * 0.4
                  : MediaQuery.of(context).size.width * 0.4,
      child: AvatarGlow(
        endRadius: 150,
        glowColor: Colors.blueGrey,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.width < 500
              ? 90
              : MediaQuery.of(context).size.width < 900
                  ? 100
                  : MediaQuery.of(context).size.width < 1600
                      ? 110
                      : 130,
          // backgroundImage: AssetImage('./assets/profile_pic.jpg'),
          backgroundImage: const NetworkImage(
              'https://avatars.githubusercontent.com/u/132568227?v=4'),
        ),
      ),
    );
  }
}
