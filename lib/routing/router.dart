import 'package:admin_panel_amiyan/pages/overview/overview.dart';
import 'package:admin_panel_amiyan/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_amiyan/pages/authentication/authentication.dart';
import 'package:admin_panel_amiyan/pages/clients/clients.dart';
import 'package:admin_panel_amiyan/pages/drivers/drivers.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case OverViewPageRoute:
      return _getPageRoute(OverViewPage());
    case DriversPageRoute:
      return _getPageRoute(DriversPage());
    case ClientsPageRoute:
      return _getPageRoute(ClientsPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}

