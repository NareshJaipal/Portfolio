import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/footer.dart';
import 'screens/skills.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final skillKey = GlobalKey();
  final homeKey = GlobalKey();

  bool isMobile = false;
  List<Widget> navbarItems = [];

  @override
  void initState() {
    navbarItems = [
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(homeKey.currentContext!);
          },
          child: const Text("Home"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(skillKey.currentContext!);
          },
          child: const Text("Skills"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Projects"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () {
              // Scrollable.ensureVisible(skillKey.currentContext!);
            },
            child: const Text("Contact")),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        title: const Text('Flutter Developer'),
        actions: isMobile ? null : navbarItems,
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(children: navbarItems),
            )
          : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('./assets/home_screen.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: HomeScreen(key: homeKey),
              ),
              Skills(key: skillKey),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
