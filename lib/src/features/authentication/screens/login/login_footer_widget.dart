import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(height: FormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage(GoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {},
            label: Text(SignInGoogle),
          ),
        ),
        SizedBox(height: FormHeight - 20),
        TextButton(
          onPressed: () {},
          child: const Text.rich(
            TextSpan(
                text: DontHaveAnAccount, children: [TextSpan(text: SignUp)]),
          ),
        )
      ],
    );
  }
}
