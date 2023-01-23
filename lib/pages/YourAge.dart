import 'package:bmr_cacluator/config/utils/appstrings.dart';
import 'package:bmr_cacluator/config/utils/assets_manager.dart';
import 'package:bmr_cacluator/config/utils/values_manager.dart';
import 'package:bmr_cacluator/pages/widgets/next_button.dart';
import 'package:bmr_cacluator/pages/yourHeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../VeiwModle/appViewModel.dart';
import '../config/utils/fontManger.dart';

class YourAgeScreen extends StatefulWidget {
  const YourAgeScreen({super.key});

  @override
  State<YourAgeScreen> createState() => _YourAgeScreenState();
}

class _YourAgeScreenState extends State<YourAgeScreen> {
  final _appViewModel = Get.put(AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourAge),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  _appViewModel.isMale.value
                      ? ImageAssets.male
                      : ImageAssets.female,
                  fit: BoxFit.contain,
                ),
              )),
          const SizedBox(
            height: AppSize.s50,
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => Column(
                children: [
                  Slider(
                    label: '${_appViewModel.age.toInt()}Years',
                    activeColor: Theme.of(context).primaryColor,
                    min: 1,
                    max: 100,
                    value: _appViewModel.age.value,
                    onChanged: (double value) {
                      _appViewModel.age.value = value;
                    },
                  ),
                  Text(
                    '${_appViewModel.age.toInt()} Years',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: FontSize.s22),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: nextButton(toNextScreen: () {
        Get.to(() => const YourHeight());
      }),
    );
  }
}
