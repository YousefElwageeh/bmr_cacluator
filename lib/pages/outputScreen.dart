// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:bmr_cacluator/config/utils/assets_manager.dart';
import 'package:bmr_cacluator/config/utils/fontManger.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../VeiwModle/appViewModel.dart';

class OutputScreen extends StatefulWidget {
  OutputScreen(
    this.BMI_result,
    this.BMR_result, {
    super.key,
  });
  double BMI_result;
  int BMR_result;
  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  late ConfettiController _centerController;
  @override
  void initState() {
    super.initState();
    _centerController =
        ConfettiController(duration: const Duration(seconds: 10));
    _centerController.play();
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  final _appViewModel = Get.put(AppViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ConfettiWidget(
              confettiController: _centerController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 1,
              emissionFrequency: 0.01,

              // 10 paticles will pop-up at a time
              numberOfParticles: 60,
              maximumSize: const Size(16, 9),
              minimumSize: const Size(10, 5),
              // particles will come down
              gravity: 0.4,

              // start again as soon as the
              // animation is finished
              shouldLoop: false,

              // assign colors of any choice
              colors: const [
                Color(0xffB24592),
                Color(0xffF15F79),
                // Colors.pink,
                // Colors.orange,
                // Colors.blue
              ],
            ),
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    _appViewModel.isMale.value
                        ? ImageAssets.male
                        : ImageAssets.female,
                    fit: BoxFit.contain,
                    height: 300,
                    width: 500,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('your BMI is ${widget.BMI_result.toStringAsFixed(3)}',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: FontSize.s22)),
                    const Spacer(),
                    Text('your BMR is ${widget.BMR_result}',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: FontSize.s22)),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: bMIresult()),
          ],
        ),
      ),
    );
  }

  Widget bMIresult() {
    return Column(
      children: [
        Text('BMI Range',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontSize: FontSize.s22)),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 25,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(15)),
                  color: Colors.blue,
                ),
                child: const Center(
                    child: Text('Underweight',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
            Expanded(
              child: Container(
                height: 25,
                color: Colors.green,
                child: const Center(
                    child: Text('Normal \nweight',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
            Expanded(
              child: Container(
                height: 25,
                color: Colors.yellow.shade700,
                child: const Center(
                    child: Text('Pre-Obesity',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
            Expanded(
              child: Container(
                height: 25,
                color: Colors.orange,
                child: const Center(
                    child: Text('Obesity \nclass 1',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
            Expanded(
              child: Container(
                height: 25,
                color: Colors.deepOrangeAccent,
                child: const Center(
                    child: Text('Obesity \nclass 2',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
            Expanded(
              child: Container(
                height: 25,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(15)),
                  color: Colors.red,
                ),
                child: const Center(
                    child: Text('Obesity \nclass 3',
                        style: TextStyle(fontSize: 8, color: Colors.white))),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('00',
                style: TextStyle(
                  color: Colors.transparent,
                )),
            Text('18.5'),
            Text('25.0'),
            Text('30.0'),
            Text('35.0'),
            Text('40.0'),
            Text('00',
                style: TextStyle(
                  color: Colors.transparent,
                )),
          ],
        ),
      ],
    );
  }
}
