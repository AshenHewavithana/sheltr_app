import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheltr_flutter/src/features/core/screens/maps/map_screen.dart';

import '../../../../../constants/text_strings.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(left: BorderSide(width: 4))),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => const MapScreen());
            },
            child: Text(DashboardSearch,
                style: txtTheme.headline2
                    ?.apply(color: Colors.grey.withOpacity(0.5))),
          ),
          const Icon(
            Icons.mic,
            size: 25,
          )
        ],
      ),
    );
  }
}
