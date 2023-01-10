const RootRoute = "/";

const OverViewPageDisplayName = "Статистика";
const OverViewPageRoute = "/overview";

const DriversPageDisplayName = "Начислять бонус";
const DriversPageRoute = "/drivers";

const ClientsPageDisplayName = "Обращение";
const ClientsPageRoute = "/clients";

const AuthenticationPageDisplayName = "Выйти";
const AuthenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(OverViewPageDisplayName, OverViewPageRoute),
  MenuItem(DriversPageDisplayName, DriversPageRoute),
  MenuItem(ClientsPageDisplayName, ClientsPageRoute),
  MenuItem(AuthenticationPageDisplayName, AuthenticationPageRoute),
];
