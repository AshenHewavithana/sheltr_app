import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:sheltr_flutter/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/login/login_screen.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaquery = MediaQuery.of(context);
    var brightness = mediaquery.platformBrightness;
    var height = mediaquery.size.height;

    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: isDarkMode ? SecondaryColor : PrimaryColor,
        body: Stack(
          children: [
            FadeInAnimation(
              durationInMs: 1200,
              animate: AnimatePosition(
                  bottomAfter: 0,
                  bottomBefore: -100,
                  leftAfter: 0,
                  leftBefore: 0,
                  rightAfter: 0,
                  rightBefore: 0,
                  topAfter: 0,
                  topBefore: 0),
              child: Container(
                padding: EdgeInsets.all(DefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(WelcomeScreenImage),
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        Text(WelcomeScreenTitle,
                            style: Theme.of(context).textTheme.headline3),
                        Text(
                          WelcomeScreenSubTitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text(Login.toUpperCase()),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: Text(SignUp.toUpperCase()),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
