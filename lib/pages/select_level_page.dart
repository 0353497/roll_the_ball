import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roll_the_ball/data/levels.dart';
import 'package:roll_the_ball/pages/gamepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLevelPage extends StatefulWidget {
  const SelectLevelPage({super.key});

  @override
  State<SelectLevelPage> createState() => _SelectLevelPageState();
}

class _SelectLevelPageState extends State<SelectLevelPage> {
  late int unlockedLevels = 1;
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/bg.png", fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Level",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * .7,
                  width: Get.width - 50,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 1,
                    children: [
                      for (int i = 0; i < levels.length; i++)
                        InkWell(
                          onTap: () {
                            if (i < unlockedLevels) {
                              Get.to(() => Gamepage(game: levels[i]));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: i < unlockedLevels
                                  ? Text(
                                      "${i + 1}",
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : Icon(Icons.lock, color: Colors.black),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedUnlockedLevels = prefs.getInt("unlockedLevels");
    if (cachedUnlockedLevels == null) return;
    setState(() {
      unlockedLevels = cachedUnlockedLevels;
    });
  }
}
