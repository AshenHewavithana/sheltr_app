import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                /* Section - 1 */
                FormHeaderWidget(
                  image: WelcomeScreenImage,
                  title: LoginTitle,
                  subTitle: LoginSubtitle,
                ),
                LoginFormWidget(),
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
