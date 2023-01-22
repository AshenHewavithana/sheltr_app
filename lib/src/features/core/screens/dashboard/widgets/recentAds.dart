import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';

class RecentAds extends StatelessWidget {
  const RecentAds({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            SizedBox(
              width: 350,
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(right: 10, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CardBgColor),
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
                                  child: Image(
                                      image: AssetImage(DashboardSampleImage)))
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
                            "Room for 2 boys",
                            style: txtTheme.headline3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                              child: Text(
                            "Ratmalana",
                            style: txtTheme.bodyText2,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(right: 10, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CardBgColor),
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
                                  child: Image(
                                      image: AssetImage(DashboardSampleImage)))
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
                            "Room for 2 girls",
                            style: txtTheme.headline3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                              child: Text(
                            "Borupana",
                            style: txtTheme.bodyText2,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(right: 10, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CardBgColor),
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
                                  child: Image(
                                      image: AssetImage(DashboardSampleImage)))
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
                            "Room for 2 boys",
                            style: txtTheme.headline3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                              child: Text(
                            "Dehiwala",
                            style: txtTheme.bodyText2,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
