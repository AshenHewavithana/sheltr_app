import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          FadeInAnimation(
            durationInMs: 1600,
            child: Image(image: AssetImage(SplashScreenIcon)),
            animate: AnimatePosition(
                topAfter: 0, topBefore: -30, leftBefore: -30, leftAfter: 0),
          ),
          FadeInAnimation(
            durationInMs: 1600,
            animate: AnimatePosition(
                topBefore: 110,
                topAfter: 110,
                leftAfter: DefaultSize,
                leftBefore: -100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppName,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  AppTagline,
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          ),
          FadeInAnimation(
            durationInMs: 1600,
            animate: AnimatePosition(bottomBefore: 0, bottomAfter: 100),
            child: const Image(image: AssetImage(SplashScreenImage)),
          )
        ],
      ),
    );
  }
}
