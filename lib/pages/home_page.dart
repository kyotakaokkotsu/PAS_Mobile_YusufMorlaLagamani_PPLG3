import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/controllers/home_controller.dart';
import 'package:pas_mobile/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: homeController.foodList.length,
      itemBuilder: (context, index) {
        final food = homeController.foodList[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              width: 65,
              height: 65,
              
            
            ),
            title: Text(
              food.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Rp${food.price.toString()}",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed(Routes.transaction, arguments: food);
            },
          ),
        );
      },
    );
  }
}
