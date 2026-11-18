import 'package:get/get.dart';

import 'package:pas_mobile/pages/login_page.dart';
import 'package:pas_mobile/pages/main_menu_page.dart';
import 'package:pas_mobile/pages/transaction_page.dart';

class Routes {
  static const String login = "/login";
  static const String mainMenu = "/mainMenu";
  static const String transaction = "/transaction";

  static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: mainMenu, page: () => MainMenuPage()),
    GetPage(name: transaction, page: () => TransactionPage()),
  ];
}
