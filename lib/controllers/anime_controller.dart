import 'package:get/get.dart';
import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/services/api_service.dart';

class AnimeController extends GetxController {
  final ApiService apiService = ApiService();

  var animeList = <Anime>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;

  @override
  void onInit() {
    fetchAnimeList();
    super.onInit();
  }

  Future<void> fetchAnimeList() async {
    isLoading.value = true;
    try {
      final List<Anime> newAnimeList = await apiService.fetchAnimeList(page: currentPage.value);
      animeList.value = newAnimeList;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() {
    currentPage.value++;
    fetchAnimeList();
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      fetchAnimeList();
    }
  }
}
