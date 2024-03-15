import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/login/login_screen.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          height: FormHeight - 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image(
              image: AssetImage(GoogleLogoImage),
              width: 20.0,
            ),
            label: Text(SignInGoogle.toUpperCase()),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: AlreadyHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                text: dLogin.toUpperCase(),
              ),
            ])))
      ],
    );
  }
}
