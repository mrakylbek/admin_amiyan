import 'package:admin_panel_amiyan/constants/controllers.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const HorizontalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("Not Hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHover(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHover(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(
                    width: 6,
                    height: 40,
                    color: dark,
                  ),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                ),
                SizedBox(
                  width: _width / 80,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName),
                ),
                if (!menuController.isActive(itemName))
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: menuController.isHover(itemName) ? dark : lightGrey,
                    weight: FontWeight.normal,
                    size: 18,
                  ))
                else
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: dark,
                    size: 18,
                    weight: FontWeight.bold,
                  ))
              ],
            ),
          )),
    );
  }
}
