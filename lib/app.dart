import 'package:bmr_cacluator/config/utils/theme_manager.dart';
import 'package:bmr_cacluator/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: getApplicationTheme(),
    );
  }
}
