import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';
import 'package:sheltr_flutter/src/constants/image_strings.dart';
import 'package:sheltr_flutter/src/constants/sizes.dart';
import 'package:sheltr_flutter/src/constants/text_strings.dart';

import 'widgets/appBar.dart';
import 'widgets/categories.dart';
import 'widgets/recentAds.dart';
import 'widgets/search.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(DashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DashboardTitle,
                style: txtTheme.bodyText2,
              ),
              Text(
                DashboardHeading,
                style: txtTheme.headline2,
              ),
              const SizedBox(
                height: DashboardPadding,
              ),
              // Search Box
              Search(txtTheme: txtTheme),
              const SizedBox(
                height: DashboardPadding,
              ),
              // Banners
              Categories(txtTheme: txtTheme),
              const SizedBox(
                height: DashboardPadding,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("View All"),
                  ),
                ),
              ),
              // Recent Ads
              Text(
                DashboardRecentAds,
                style: txtTheme.headline4?.apply(fontSizeFactor: 1.5),
              ),
              RecentAds(txtTheme: txtTheme),
              const SizedBox(
                height: DashboardPadding,
              ),
              // Rent your Property
              Text(
                DashboardRentProperty,
                style: txtTheme.headline4?.apply(fontSizeFactor: 1.5),
              ),
              SizedBox(
                width: double.infinity,
                height: 190,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CardBgColor),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Join Now\nTo Rent your Property",
                              style: txtTheme.headline3,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Flexible(
                              child:
                                  Image(image: AssetImage(DashboardRentImage)))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
