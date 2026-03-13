import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:roll_the_ball/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(onInit: () => _initApp(), home: const Homepage());
  }

  static void _initApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("unlockedLevels")) {
      prefs.setInt("unlockedLevels", 1);
    }
  }
}
