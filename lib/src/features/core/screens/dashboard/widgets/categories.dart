import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/core/screens/shared_rooms/shared_rooms_screen.dart';
import 'package:sheltr_flutter/src/features/core/screens/single_rooms/single_rooms_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: CardBgColor),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                        child: Image(image: AssetImage(DashboardSingleImage)))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => SingleRoom(
                            txtTheme: txtTheme,
                          ));
                    },
                    child: Text(
                      DashboardBannerTitle1,
                      style: txtTheme.headline4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: DashboardCardPadding,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CardBgColor),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Flexible(
                            child:
                                Image(image: AssetImage(DashboardSharedImage)))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SharedRoom(
                                txtTheme: txtTheme,
                              ));
                        },
                        child: Text(
                          DashboardBannerTitle2,
                          style: txtTheme.headline4,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
