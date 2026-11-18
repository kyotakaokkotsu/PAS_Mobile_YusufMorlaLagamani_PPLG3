import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile/models/premier_league_model.dart';

class FeatController extends GetxController {
  var isLoading = true.obs;
  var teamList = <Team>[].obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTeams();
  }

  Future<void> getTeams() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";

      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League",
      );

      final response = await http.get(url).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final result = PremierLeagueModel.fromJson(data);

        teamList.assignAll(result.teams);
      } else {
        errorMessage.value = "Gagal mengambil data dari server";
      }
    } catch (e) {
      errorMessage.value = "Tidak dapat terhubung ke server: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
