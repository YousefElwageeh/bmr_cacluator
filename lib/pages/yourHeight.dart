import 'package:bmr_cacluator/config/utils/appstrings.dart';
import 'package:bmr_cacluator/config/utils/assets_manager.dart';
import 'package:bmr_cacluator/pages/yourWeight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:height_slider/height_slider.dart';

import '../VeiwModle/appViewModel.dart';
import 'widgets/next_button.dart';

class YourHeight extends StatefulWidget {
  const YourHeight({super.key});

  @override
  State<YourHeight> createState() => _YourHeightState();
}

class _YourHeightState extends State<YourHeight> {
  final _appViewModel = Get.put(AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourHeight),
      ),
      body: Center(
        child: Obx(
          () => HeightSlider(
            height: _appViewModel.height.value,
            maxHeight: 200,
            personImagePath: _appViewModel.isMale.value
                ? ImageAssets.male
                : ImageAssets.female,

            onChange: (value) {
              _appViewModel.height.value = value;
            },
            unit: 'cm', // optional
          ),
        ),
      ),
      floatingActionButton: nextButton(toNextScreen: () {
        Get.to(() => const YourWeight());
      }),
    );
  }
}
