import 'package:bmr_cacluator/VeiwModle/appViewModel.dart';
import 'package:bmr_cacluator/config/utils/assets_manager.dart';
import 'package:bmr_cacluator/pages/outputScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../config/utils/appstrings.dart';
import 'widgets/next_button.dart';

class YourWeight extends StatefulWidget {
  const YourWeight({super.key});

  @override
  State<YourWeight> createState() => _YourWeightState();
}

class _YourWeightState extends State<YourWeight> {
  final _appViewModel = Get.put(AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourWeightAndAge),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                _appViewModel.isMale.value
                    ? ImageAssets.male
                    : ImageAssets.female,
                fit: BoxFit.contain,
              ),
            )),
            Expanded(
              child: SleekCircularSlider(
                min: 20,
                max: 150,
                initialValue: 50,
                appearance:
                    CircularSliderAppearance(infoProperties: InfoProperties(
                  modifier: (percentage) {
                    return '${percentage.toInt()}KG';
                  },
                )),

                onChangeEnd: (double endValue) {
                  _appViewModel.weight.value = endValue;
                },
                // innerWidget: (double value) {
                //   // use your custom widget inside the slider (gets a slider value from the callback)
                //   //   return Text('${value.toInt()} KG');
                // },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: nextButton(toNextScreen: () {
        double BMIResult = _appViewModel.calcluateBMI();
        int BMRResult = _appViewModel.calcluateBMR();
        Get.to(() => OutputScreen(
              BMIResult,
              BMRResult,
            ));
      }),
    );
  }
}
