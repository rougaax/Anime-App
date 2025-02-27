import 'package:flutter/material.dart';
import 'package:anime_app/model/anime_model.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Anime anime;

  const AnimeDetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'anime_title_${anime.malId}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              anime.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'anime_image_${anime.malId}',
                child: Image.network(anime.imageUrl),
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 8.0),
            Text(
              anime.synopsis,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}