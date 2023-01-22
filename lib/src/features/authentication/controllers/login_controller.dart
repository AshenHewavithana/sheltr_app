import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/core/screens/dashboard/dashboard.dart';
import 'package:sheltr_flutter/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    } else {
      Get.to(() => Dashboard());
    }
  }
}
