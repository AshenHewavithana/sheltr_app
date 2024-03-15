import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';

class SingleRoomAd extends StatelessWidget {
  const SingleRoomAd(
      {super.key,
      required this.txtTheme,
      required this.adTitle,
      required this.location});

  final TextTheme txtTheme;
  final String adTitle;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Padding(
        padding: EdgeInsets.only(right: 10, top: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: CardBgColor),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 320,
                height: 220,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Image(image: AssetImage(DashboardSampleImage)))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    adTitle,
                    style: txtTheme.headline3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Flexible(
                      child: Text(
                    location,
                    style: txtTheme.bodyText2,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
