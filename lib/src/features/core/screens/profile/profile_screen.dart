import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';
import 'package:sheltr_flutter/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:sheltr_flutter/src/features/core/screens/profile/update_profile_screen.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
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
          Profile,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(DefaultSize),
          child: Column(
            children: [
              // Profile Heading
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage(DashboardProfileImage),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: PrimaryColor),
                        child: IconButton(
                          icon: Icon(LineAwesomeIcons.alternate_pencil),
                          color: Colors.black,
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                ProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),

              // Edit Profile Button
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => UpdateProfile()),
                    child: Text(
                      EditProfile,
                      style: TextStyle(color: DarkColor),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColor,
                        side: BorderSide.none,
                        shape: StadiumBorder()),
                  )),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),

              // Menu
              ProfileMenuWidget(
                title: Menu1,
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: Menu2,
                icon: LineAwesomeIcons.helping_hands,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: Menu3,
                icon: LineAwesomeIcons.money_bill,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: Menu4,
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: Logout,
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Get.to(() => WelcomeScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
