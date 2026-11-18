import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/controllers/transaction_controller.dart';
import 'package:pas_mobile/models/food_model.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  final FoodModel food = Get.arguments as FoodModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController(food: food));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi Pembelian"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 180,
                  height: 150,
                  child: food.imageUrl.isNotEmpty
                      ? Image.network(
                          food.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.fastfood, size: 70);
                          },
                        )
                      : const Icon(Icons.fastfood, size: 70),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              food.name,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(food.description, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            Text(
              "Harga: ${controller.formatRupiah(food.price.toDouble())}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Jumlah Pembelian",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.txtQuantity,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Masukkan jumlah makanan",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.calculatePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Bayar", style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 25),
            Obx(
              () => controller.isPaid.value
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Rincian Pembayaran",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(height: 25),
                            _paymentRow(
                              "Subtotal",
                              controller.formatRupiah(
                                controller.subtotal.value,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _paymentRow(
                              "PPN (5%)",
                              controller.formatRupiah(controller.ppn.value),
                            ),
                            const Divider(height: 25),
                            _paymentRow(
                              "Total Bayar",
                              controller.formatRupiah(controller.total.value),
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
