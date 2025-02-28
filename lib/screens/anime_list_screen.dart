import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/controllers/anime_controller.dart';
import 'package:anime_app/screens/anime_detail_screen.dart';

class AnimeListScreen extends StatefulWidget {
  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  final AnimeController controller = Get.put(AnimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Jikan Anime App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.animeList.isEmpty) {
          return const Center(
              child: Text(
                'Anime tidak ditemukan!',
                style: TextStyle(color: Colors.black),
              ));
        } else {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.animeList.length,
                itemBuilder: (context, index) {
                  final anime = controller.animeList[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Hero(
                        tag: 'anime_image_${anime.malId}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(anime.imageUrl,
                              width: 50, height: 75, fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(
                        anime.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () {
                        Get.to(() => AnimeDetailScreen(anime: anime));
                      },
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  heroTag: 'prevPage',
                  onPressed: controller.currentPage.value > 1
                      ? () {
                    controller.previousPage();
                    setState(() {});
                  }
                      : null,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  heroTag: 'nextPage',
                  onPressed: controller.animeList.isNotEmpty
                      ? () {
                    controller.nextPage();
                    setState(() {});
                  }
                      : null,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 100,
                right: 100,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Page ${controller.currentPage.value}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
