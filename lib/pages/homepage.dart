import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roll_the_ball/pages/select_level_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = (Get.width - 100)
        .clamp(0.0, double.maxFinite)
        .toDouble();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/logo.png",
              width: Get.width * .8,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 64,
              width: buttonWidth,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                ),
                onPressed: () => Get.to(const SelectLevelPage()),
                child: Text("Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void init() async {
    await Future.delayed(1.seconds);
    setState(() {});
  }
}
