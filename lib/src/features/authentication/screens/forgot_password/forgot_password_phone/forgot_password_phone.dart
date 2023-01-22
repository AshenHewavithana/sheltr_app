import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/common_widgets/form/form_header_widget.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: DefaultSize * 4,
                ),
                const FormHeaderWidget(
                  image: ForgotPasswordImage,
                  title: ForgotPassword,
                  subTitle: ForgotPasswordPhoneSubtitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: FormHeight,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(PhoneNumber),
                          hintText: PhoneNumber,
                          prefixIcon: Icon(Icons.phone_outlined)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text(Next))),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
