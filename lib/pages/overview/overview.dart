import 'package:admin_panel_amiyan/pages/overview/widgets/overview_cards_large.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/overview_cards_medium.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/overview_cards_small.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/revenue_section_large.dart';
import 'package:admin_panel_amiyan/pages/overview/widgets/revenue_section_small.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    color: Colors.black,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomScreen(context))
                  OverviewCardsMediumScreen()
                else
                  OverviewCardsLargeScreen()
              else
                OverviewCardsSmallScreen(),
              if (ResponsiveWidget.isLargeScreen(context))
                RevenueSectionLarge()
              else
                RevenueSectionSmall()
            ],
          ),
        )
      ],
    );
    //   Center(
    //   child: CustomText(
    //     text: "OverView",
    //     size: 18,
    //     weight: FontWeight.normal,
    //     color: Colors.black,
    //   ),
    // );
  }
}
