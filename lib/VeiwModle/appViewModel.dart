// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../pages/maleOrFemale.dart';

class AppViewModel extends GetxController {
  RxBool isMale = true.obs;
  void chooseYourGender() {
    isMale.value = !isMale.value;
  }

  RxInt height = 170.obs;
  RxDouble weight = 60.0.obs;
  RxDouble age = 15.0.obs;

  int calcluateBMR() {
    int BMR_Result =
        isMale.value ? calcluateBMRForMen() : calcluateBMRForWomen();
    return BMR_Result;
  }

  int calcluateBMRForMen() {
    double BMR = 88.362 +
        (13.397 * weight.value) +
        (4.799 * height.value) -
        (5.677 * age.value);
    return BMR.toInt();
  }

  int calcluateBMRForWomen() {
    double BMR = 447.593 +
        (9.247 * weight.value) +
        (3.098 * height.value) -
        (4.330 * age.value);
    return BMR.toInt();
  }

  double calcluateBMI() {
    double BMI_Result = weight.value / pow((height.value / 100), 2);
    return BMI_Result;
  }

  void startTimer() {
    const splashScreenTime = Duration(seconds: 3);
    Timer timer = Timer.periodic(
      splashScreenTime,
      (Timer timer) {
        Get.off(() => const GenderScreen());
        timer.cancel();
      },
    );
  }
}
