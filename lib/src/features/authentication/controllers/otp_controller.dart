import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:sheltr_flutter/src/features/core/screens/dashboard/dashboard.dart';
import 'package:sheltr_flutter/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isverified = await AuthenticationRepository.instance.verifyOTP(otp);
    isverified ? Get.offAll(onBoardingScreen()) : Get.back();
  }
}
