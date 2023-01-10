import 'package:admin_panel_amiyan/pages/drivers/widgets/giving_bonus.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/responsiveness.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({Key? key}) : super(key: key);

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
        SizedBox(height: 75),
        Expanded(
          child: ListView(
            children: [
              Center(child: GivingBonus()),
            ],
          ),
        )
      ],
    );

    //   Center(
    //   child: CustomText(text: "Drivers", size: 18, weight: FontWeight.normal, color: Colors.black,),
    // );
  }
}
