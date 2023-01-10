import 'package:admin_panel_amiyan/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: localNovigator(),
    );
    //   Container(
    //   constraints: BoxConstraints.expand(),
    //   color: Colors.green,
    //   // child: SideMenu(),
    // );
  }
}
