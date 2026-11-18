import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile/controllers/main_menu_controller.dart';
import 'package:pas_mobile/pages/home_page.dart';
import 'package:pas_mobile/pages/feat_page.dart';
import 'package:pas_mobile/pages/profile_page.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController controller = Get.put(MainMenuController());

  final List<Widget> listPages = [
    const HomePage(),
    const FeatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("PAS Mobile"), centerTitle: true),

        body: listPages[controller.selectedIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Feat",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
