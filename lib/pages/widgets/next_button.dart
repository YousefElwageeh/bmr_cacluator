import 'package:flutter/material.dart';

import '../../config/colorManger.dart';
import '../../config/utils/values_manager.dart';

Widget nextButton({required Function toNextScreen}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FloatingActionButton(
        onPressed: () {
          toNextScreen();
        },
        backgroundColor: ColorManager.primary,
        child: const Icon(Icons.arrow_right_alt, size: AppSize.s40),
      ),
    ],
  );
}
