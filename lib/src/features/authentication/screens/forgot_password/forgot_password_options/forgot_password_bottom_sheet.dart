import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/forgot_password/forgot_password_email/forgot_password_email.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/forgot_password/forgot_password_phone/forgot_password_phone.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(DefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ForgotPasswordTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              ForgotPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: DefaultSize,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.email_outlined,
              title: Email,
              subTitle: ResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordEmailScreen());
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_outlined,
              title: PhoneNumber,
              subTitle: ResetViaPhone,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordPhoneScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
