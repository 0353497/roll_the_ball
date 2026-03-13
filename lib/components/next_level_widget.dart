import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roll_the_ball/data/levels.dart';
import 'package:roll_the_ball/pages/gamepage.dart';
import 'package:roll_the_ball/pages/select_level_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NextLevelWidget extends StatelessWidget {
  const NextLevelWidget({
    super.key,
    required this.nextLevelIndex,
    required this.attempts,
  });

  final int nextLevelIndex;
  final int attempts;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: Get.width - 100,
        height: Get.height * .3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "attempts $attempts",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Text(
                "Level Complete",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 60,
                child: TextButton(
                  onPressed: () async {
                    await unlockNextLevel();
                    Get.off(
                      () => Gamepage(
                        game: levels[nextLevelIndex % levels.length],
                      ),
                      preventDuplicates: false,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff0E0942)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                  ),
                  child: Text(
                    "Next level",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await unlockNextLevel();

                  Get.to(() => SelectLevelPage());
                },
                child: Text(
                  "Back to home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> unlockNextLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final currentUnlockedLevels = prefs.getInt("unlockedLevels") ?? 1;
    final nextUnlockedLevels = (nextLevelIndex + 1).clamp(1, levels.length);
    await prefs.setInt(
      "unlockedLevels",
      nextUnlockedLevels > currentUnlockedLevels
          ? nextUnlockedLevels
          : currentUnlockedLevels,
    );
    final newValue = prefs.getInt("unlockedLevels");
    print(newValue);
  }
}
