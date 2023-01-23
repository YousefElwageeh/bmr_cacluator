import 'package:bmr_cacluator/config/colorManger.dart';
import 'package:bmr_cacluator/config/utils/values_manager.dart';
import 'package:bmr_cacluator/pages/YourAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../VeiwModle/appViewModel.dart';
import '../config/utils/appStrings.dart';
import '../config/utils/assets_manager.dart';
import 'widgets/next_button.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final _appViewModel = Get.put(AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.chooseOne),
        ),
        backgroundColor: ColorManager.white,
        body: Column(
          children: [maleORfemaleWidget()],
        ),
        floatingActionButton: nextButton(toNextScreen: () {
          Get.to(() => const YourAgeScreen());
        }));
  }

  Widget maleORfemaleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s60, vertical: AppSize.s60),
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                _appViewModel.isMale.value = true;
              }),
              child: Column(
                children: [
                  SvgPicture.asset(
                    color: _appViewModel.isMale.value ? null : Colors.grey,
                    ImageAssets.male,
                    fit: BoxFit.cover,
                    width: AppSize.s60,
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const Text(
                    'Male',
                  )
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => _appViewModel.isMale.value = false,
              child: Column(
                children: [
                  SvgPicture.asset(
                    color: _appViewModel.isMale.value ? Colors.grey : null,
                    ImageAssets.female,
                    fit: BoxFit.cover,
                    width: AppSize.s60,
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const Text(
                    'female',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
