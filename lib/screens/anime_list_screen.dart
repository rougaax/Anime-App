import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/controllers/anime_controller.dart';
import 'package:anime_app/screens/anime_detail_screen.dart';

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
          return const Center(child: CircularProgressIndicator());
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
                title: Text(anime.title),
                onTap: () {
                  Get.to(() => AnimeDetailScreen(anime: anime));
                },
              );
            },
          );
        }
      }),
    );
  }
}
