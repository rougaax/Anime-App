import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/services/api_service.dart';
import 'package:anime_app/screens/anime_detail_screen.dart';

class AnimeController extends GetxController {
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
      var anime = await ApiService().fetchAnimeList(page: 1, limit: 25);
      animeList.assignAll(anime);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat anime: $e');
    } finally {
      isLoading(false);
    }
  }
}

class AnimeListScreen extends StatelessWidget {
  final AnimeController controller = Get.put(AnimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jikan Anime App'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: AnimatedOpacity(
              opacity: controller.isLoading.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const CircularProgressIndicator(),
            ),
          );
        } else if (controller.animeList.isEmpty) {
          return const Center(child: Text('Anime tidak ditemukan!'));
        } else {
          return ListView.builder(
            itemCount: controller.animeList.length,
            itemBuilder: (context, index) {
              final anime = controller.animeList[index];
              return ListTile(
                leading: Hero(
                  tag: 'anime_image_${anime.malId}',
                  child: Image.network(anime.imageUrl, width: 50, height: 75),
                ),
                title: Hero(
                  tag: 'anime_title_${anime.malId}',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      anime.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(
                        () => AnimeDetailScreen(anime: anime),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }
}