import 'package:get/get.dart';
import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/services/api_service.dart';

class AnimeController extends GetxController {
  final ApiService apiService = Get.find();
  var animeList = <Anime>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAnimeList();
    super.onInit();
  }

  void fetchAnimeList() async {
    try {
      isLoading(true);
      var anime = await apiService.fetchAnimeList(page: 1);
      animeList.assignAll(anime);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat anime: $e');
    } finally {
      isLoading(false);
    }
  }
}
