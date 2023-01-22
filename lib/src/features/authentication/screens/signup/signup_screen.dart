import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import 'widgets/signup_footer_widget.dart';
import 'widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(DefaultSize),
          child: Column(
            children: [
              FormHeaderWidget(
                image: WelcomeScreenImage,
                title: SignupTitle,
                subTitle: SignupSubTitle,
              ),
              SignUpFormWidget(),
              SignUpFooterWidget()
            ],
          ),
        ),
      )),
    );
  }
}
