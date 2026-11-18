import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/models/food_model.dart';

class TransactionController extends GetxController {
  final FoodModel food;

  TransactionController({required this.food});

  final txtQuantity = TextEditingController();

  var subtotal = 0.0.obs;
  var ppn = 0.0.obs;
  var total = 0.0.obs;
  var isPaid = false.obs;

  void calculatePayment() {
    final quantity = int.tryParse(txtQuantity.text);

    if (quantity == null || quantity <= 0) {
      Get.snackbar("Peringatan", "Masukkan jumlah makanan yang valid");
      return;
    }

    subtotal.value = (food.price * quantity).toDouble();
    ppn.value = subtotal.value * 0.05;
    total.value = subtotal.value + ppn.value;
    isPaid.value = true;
  }

  String formatRupiah(double amount) {
    final value = amount.toInt().toString();
    final formatted = value.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );

    return "Rp$formatted";
  }

  @override
  void onClose() {
    txtQuantity.dispose();
    super.onClose();
  }
}
