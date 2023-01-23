import 'package:bmr_cacluator/config/colorManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../VeiwModle/appViewModel.dart';
import '../config/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _appViewModel = Get.put(AppViewModel());
  @override
  void initState() {
    super.initState();
    _appViewModel.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorManager.splashColor,
                ColorManager.splashColor2,
              ],
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageAssets.splashLogo,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
