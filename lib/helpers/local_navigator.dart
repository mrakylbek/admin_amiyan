import 'package:admin_panel_amiyan/constants/controllers.dart';
import 'package:admin_panel_amiyan/routing/router.dart';
import 'package:admin_panel_amiyan/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator localNovigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: OverViewPageRoute,
      // initialRoute: AuthenticationPageRoute,
      onGenerateRoute: generateRoute,
    );
