import 'package:admin_panel_amiyan/helpers/responsiveness.dart';
import 'package:admin_panel_amiyan/helpers/local_navigator.dart';
import 'package:admin_panel_amiyan/widgets/large_screen.dart';
import 'package:admin_panel_amiyan/widgets/side_menu.dart';
import 'package:admin_panel_amiyan/widgets/small_screen.dart';
import 'package:admin_panel_amiyan/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body:

      // ResponsiveWidget(
      //   largeScreen: LargeScreen(),
      //   smallScreen: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16),
      //     child: localNavigator(),
      //   ),
      //   mediumScreen: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16),
      //     child: localNavigator(),
      //   ),
      //   customScreen: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16),
      //     child: localNavigator(),
      //   ),
      // ),

      ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen(),mediumScreen: LargeScreen(),),
    );
  }
}
