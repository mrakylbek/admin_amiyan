import 'dart:ui';

import 'package:admin_panel_amiyan/constants/style.dart';
import 'package:admin_panel_amiyan/controllers/menu_controller.dart';
import 'package:admin_panel_amiyan/controllers/navigation_controller.dart';
import 'package:admin_panel_amiyan/layout.dart';
import 'package:admin_panel_amiyan/pages/404/error.dart';
import 'package:admin_panel_amiyan/pages/authentication/authentication.dart';
import 'package:admin_panel_amiyan/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthenticationPageRoute,
      unknownRoute: GetPage(
          name: "/not-found",
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(name: RootRoute, page: () => SiteLayout()),
        GetPage(
            name: AuthenticationPageRoute, page: () => AuthenticationPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Amiyan',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
      // home: SiteLayout(),
      // home: AuthenticationPage(),
      // home: SendToClients(),
    );
  }
}
