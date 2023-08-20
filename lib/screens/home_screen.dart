import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).size.width < 500
          ? const EdgeInsets.symmetric(vertical: 30)
          : MediaQuery.of(context).size.width < 900
              ? const EdgeInsets.symmetric(vertical: 50)
              : const EdgeInsets.symmetric(vertical: 70),
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
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Text(
            'Naresh Jaipal',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Text(
                "And I'm a ",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.022,
                    // fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),

              //
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.025,
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
      width: MediaQuery.of(context).size.width < 900
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width < 1600
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width * 0.4,
      child: const AvatarGlow(
        endRadius: 150,
        glowColor: Colors.blueGrey,
        child: CircleAvatar(
          minRadius: 100,
          maxRadius: 120,
          // backgroundImage: AssetImage('./assets/profile_pic.jpg'),
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/132568227?v=4'),
        ),
      ),
    );
  }
}
