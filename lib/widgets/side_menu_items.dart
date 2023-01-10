import 'package:admin_panel_amiyan/helpers/responsiveness.dart';
import 'package:admin_panel_amiyan/widgets/horizontal_menu_item.dart';
import 'package:admin_panel_amiyan/widgets/vertical_menu_items.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isCustomScreen(context))
      return VerticalMenuItem(itemName: itemName, onTap: onTap);

    return HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
