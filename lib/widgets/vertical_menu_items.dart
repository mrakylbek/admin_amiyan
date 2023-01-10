import 'package:admin_panel_amiyan/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const VerticalMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not Hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHover(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHover(itemName) ||
                    menuController.isActive(itemName),
                child: Container(
                  width: 3,
                  height: 72,
                  color: dark,
                ),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
              ),
              
              Expanded(child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
              )),
            ],
          ),
        ),
      ),
    );
  }
}
