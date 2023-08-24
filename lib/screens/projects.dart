import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../database/database.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '   Projects',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 60,
              fontWeight: FontWeight.w800,
            ),
          ),
          Center(
            child: Wrap(
              children: [
                // Chat App
                MyProject(
                  title: 'Chat App',
                  disc:
                      'A realtime public chat room application that can update in realtime and allow for communication for user',
                  appUrl: 'https://nareshjaipal.github.io/Chat-App/#/',
                  pics: chatAppImgList,
                ),

                // Contact App
                MyProject(
                  title: 'Contact App',
                  disc:
                      'A contact management app that can store user contacts and edit the user contacts',
                  appUrl:
                      'https://nareshjaipal.github.io/Flutter_Projects/contacts/build/#/',
                  pics: contactAppImgList,
                ),

                // Calculator
                MyProject(
                  title: 'Calculator',
                  disc: 'A simple yet beautiful calculator app',
                  appUrl:
                      'https://nareshjaipal.github.io/Flutter_Projects/calculator/docs/',
                  pics: calculatorAppImgList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyProject extends StatelessWidget {
  final String title;
  final String disc;
  final String appUrl;
  final List<String> pics;

  const MyProject({
    super.key,
    required this.title,
    required this.disc,
    required this.appUrl,
    required this.pics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: MediaQuery.of(context).size.width < 400
          ? const EdgeInsets.all(10)
          : MediaQuery.of(context).size.width < 650
              ? const EdgeInsets.all(20)
              : MediaQuery.of(context).size.width < 950
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(40),
      width: 230,
      height: 450,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: pics.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Center(
                  child: Image.network(
                    pics[index],
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            disc,
            style: const TextStyle(color: Colors.white60),
          ),
          TextButton(
            onPressed: () async {
              final Uri url = Uri.parse(appUrl);
              launchUrl(url);
            },
            child: const Text(
              'Open Project',
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
