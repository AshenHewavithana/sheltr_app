import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../profile/profile_screen.dart';

class RentRoom extends StatelessWidget {
  const RentRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              LineAwesomeIcons.angle_left,
              color: Colors.black,
            ),
          ),
          title: Text(
            "JOIN SHELTR",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: CardBgColor),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const ProfileScreen());
                },
                icon: Image(
                  image: AssetImage(DashboardProfileImage),
                  width: 20,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView());
  }
}
