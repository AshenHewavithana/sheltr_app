import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/authentication/controllers/login_controller.dart';
import 'package:sheltr_flutter/src/features/core/screens/dashboard/dashboard.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forgot_password/forgot_password_options/forgot_password_bottom_sheet.dart';
import '../forgot_password/forgot_password_options/forgot_password_btn_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Column(
        key: _formKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: Email,
                hintText: Email,
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: FormHeight - 20,
          ),
          TextFormField(
            controller: controller.password,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: Password,
              hintText: Password,
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.remove_red_eye_sharp),
            ),
          ),
          const SizedBox(
            height: FormHeight - 20,
          ),
          // Forgot Password Button
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(ForgetPassword))),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  // LoginController.instance.loginUser(
                  //     controller.email.text.trim(),
                  //     controller.password.text.trim());
                },
                child: Text(LoginButton.toUpperCase())),
          )
        ],
      ),
    ));
  }
}
