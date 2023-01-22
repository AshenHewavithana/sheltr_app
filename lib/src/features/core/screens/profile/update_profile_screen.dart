import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/features/authentication/models/user_model.dart';
import 'package:sheltr_flutter/src/features/core/controllers/profile_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
          EditProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(DefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
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
                                  icon: Icon(LineAwesomeIcons.camera),
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
                        height: 50,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: const InputDecoration(
                                  label: Text(Fullname),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded)),
                            ),
                            SizedBox(
                              height: FormHeight - 20,
                            ),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text(Email),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: FormHeight - 20,
                            ),
                            TextFormField(
                              initialValue: userData.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text(PhoneNumber),
                                  prefixIcon: Icon(Icons.phone)),
                            ),
                            SizedBox(
                              height: FormHeight - 20,
                            ),
                            TextFormField(
                              initialValue: userData.password,
                              decoration: const InputDecoration(
                                  label: Text(Password),
                                  prefixIcon: Icon(Icons.fingerprint_outlined)),
                            ),
                            SizedBox(
                              height: FormHeight,
                            ),

                            // Edit Profile Button
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => UpdateProfile()),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: PrimaryColor,
                                    side: BorderSide.none,
                                    shape: StadiumBorder()),
                                child: Text(EditProfile,
                                    style: TextStyle(color: DarkColor)),
                              ),
                            ),
                            SizedBox(
                              height: FormHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(TextSpan(
                                    text: Joined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: JoinedAt,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12))
                                    ])),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: StadiumBorder(),
                                      side: BorderSide.none),
                                  child: Text(Delete),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Something went wrong."));
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
