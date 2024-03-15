import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../profile/profile_screen.dart';
import '../shared_rooms/widgets/shared_room_ad.dart';

class SharedRoom extends StatelessWidget {
  const SharedRoom({super.key, required this.txtTheme});

  final TextTheme txtTheme;

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
          "SHARED ROOMS",
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(DashboardPadding),
          child: Column(
            children: [
              SingleRoomAd(
                txtTheme: txtTheme,
                adTitle: "1 Room for 2 Students",
                location: "Borupana Rd",
              ),
              SizedBox(height: DefaultSize),
              SingleRoomAd(
                txtTheme: txtTheme,
                adTitle: "Room for KDU Girls",
                location: "Attidiya Rd",
              ),
              SizedBox(height: DefaultSize),
              SingleRoomAd(
                txtTheme: txtTheme,
                adTitle: "Shared Room for 2 Students",
                location: "Kandawala Rd",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
