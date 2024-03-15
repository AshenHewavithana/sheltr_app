import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/authentication/controllers/signup_controller.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullname,
              decoration: const InputDecoration(
                  label: Text(Fullname),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(
              height: FormHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text(Email), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: FormHeight - 20,
            ),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  label: Text(PhoneNumber), prefixIcon: Icon(Icons.phone)),
            ),
            const SizedBox(
              height: FormHeight - 20,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  label: Text(Password),
                  prefixIcon: Icon(Icons.fingerprint_outlined)),
            ),
            const SizedBox(
              height: FormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.email.text.trim());
                    SignUpController.instance.phoneAuthentication(
                        controller.phoneNumber.text.trim());
                    Get.to(onBoardingScreen());
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullname.text.trim(),
                      phoneNo: controller.phoneNumber.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                  }
                  Get.to(() => onBoardingScreen());
                },
                child: Text(SignUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
