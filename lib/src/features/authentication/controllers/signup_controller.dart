import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/authentication/models/user_model.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:sheltr_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:sheltr_flutter/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNumber = TextEditingController();

  final userRep = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRep.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
