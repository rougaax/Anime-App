import 'package:flutter/material.dart';
import 'package:anime_app/model/anime_model.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Anime anime;

  const AnimeDetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'anime_image_${anime.malId}',
                  child: Image.network(
                    anime.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 16.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                anime.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailText(label: 'Type:', value: anime.type),
                  DetailText(
                      label: 'Episodes:', value: anime.episodes.toString()),
                  DetailText(label: 'Duration:', value: anime.duration),
                  DetailText(label: 'Status:', value: anime.status),
                  DetailText(label: 'Aired:', value: anime.aired),
                  DetailText(
                    label: 'Score:',
                    value: '${anime.score} (by ${anime.scoredBy} users)',
                  ),
                  DetailText(label: 'Rating:', value: anime.rating),
                  DetailText(label: 'Rank:', value: anime.rank.toString()),
                  DetailText(
                      label: 'Popularity:', value: anime.popularity.toString()),
                  DetailText(
                      label: 'Genres:', value: anime.genres.join(", ")),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Synopsis:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    anime.synopsis,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String label;
  final String value;

  const DetailText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
