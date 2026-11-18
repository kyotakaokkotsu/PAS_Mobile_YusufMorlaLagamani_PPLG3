import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/controllers/feat_controller.dart';

class FeatPage extends StatelessWidget {
  const FeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeatController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.errorMessage.value,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: controller.getTeams,
                  child: const Text("Coba Lagi"),
                ),
              ],
            ),
          ),
        );
      }

      if (controller.teamList.isEmpty) {
        return const Center(child: Text("Data klub tidak ditemukan"));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: controller.teamList.length,
        itemBuilder: (context, index) {
          final team = controller.teamList[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: SizedBox(
                width: 55,
                height: 55,
                child: team.badge.isNotEmpty
                    ? Image.network(
                        team.badge,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.sports_soccer, size: 40);
                        },
                      )
                    : const Icon(Icons.sports_soccer, size: 40),
              ),
              title: Text(
                team.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Stadion: ${team.stadium.isEmpty ? "Tidak diketahui" : team.stadium}",
              ),
            ),
          );
        },
      );
    });
  }
}
