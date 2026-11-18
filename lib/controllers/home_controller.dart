import 'package:get/get.dart';
import 'package:pas_mobile/models/food_model.dart';

class HomeController extends GetxController {
  final List<FoodModel> foodList = [
    FoodModel(
      name: "Nasi Goreng Spesial",
      price: 25000,
      description: "Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.",
      imageUrl: "https://tse2.mm.bing.net/th/id/OIP.f17QY446vIGs19AjNii71QHaE8?r=0&pid=Api&h=220&P=0",
    ),
    FoodModel(
      name: "Ayam Bakar Madu",
      price: 30000,
      description: "Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.",
      imageUrl: "https://tse4.mm.bing.net/th/id/OIP.h67WNjCaNL_Lh40I8NeHJAHaFN?r=0&pid=Api&h=220&P=0",
    ),
    FoodModel(
      name: "Sate Ayam Madura",
      price: 28000,
      description: "10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.",
      imageUrl: "https://tse3.mm.bing.net/th/id/OIP.A3S6isB0Oen7R2aTCZiztAHaE8?r=0&pid=Api&h=220&P=0",
    ),
    FoodModel(
      name: "Mie Ayam Bakso",
      price: 20000,
      description: "Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.",
      imageUrl: "https://tse2.mm.bing.net/th/id/OIP.Ybk1lgv1MFvbHLNN-mKQFwHaHa?r=0&pid=Api&h=220&P=0",
    ),
    FoodModel(
      name: "Es Teh Manis Jumbo",
      price: 8000,
      description:
          "Minuman teh melati segar dengan gula asli dan es batu kristal.",
      imageUrl: "https://tse2.mm.bing.net/th/id/OIP.6brFXqlnHbmoxEk6GEyuoAHaHa?r=0&pid=Api&h=220&P=0",
    ),
  ];
}
