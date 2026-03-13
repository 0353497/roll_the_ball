import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roll_the_ball/pages/select_level_page.dart';

class RestartDialog extends StatelessWidget {
  const RestartDialog({super.key, required this.onResetTap});
  final VoidCallback onResetTap;

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
                "Level failed",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    onResetTap.call();
                    Get.back();
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
                    "Try again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => SelectLevelPage()),
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
}
