import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sheltr_flutter/firebase_options.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:sheltr_flutter/src/features/core/screens/dashboard/dashboard.dart';
import 'package:sheltr_flutter/src/features/core/screens/maps/map_screen.dart';
import 'package:sheltr_flutter/src/repository/authentication_repository/authentication_repository.dart';
import 'package:sheltr_flutter/src/utils/theme/theme.dart';

import 'src/features/core/screens/profile/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const MapScreen(),
    );
  }
}
