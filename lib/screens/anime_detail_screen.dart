import 'package:flutter/material.dart';
import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/widget/detail_text.dart';

class AnimeDetailScreen extends StatefulWidget {
  final Anime anime;

  const AnimeDetailScreen({super.key, required this.anime});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
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
                  tag: 'anime_image_${widget.anime.malId}',
                  child: Image.network(
                    widget.anime.imageUrl,
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
                widget.anime.title,
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
                  DetailText(label: 'Type:', value: widget.anime.type),
                  DetailText(
                    label: 'Episodes:',
                    value: widget.anime.episodes.toString(),
                  ),
                  DetailText(label: 'Duration:', value: widget.anime.duration),
                  DetailText(label: 'Status:', value: widget.anime.status),
                  DetailText(label: 'Aired:', value: widget.anime.aired),
                  DetailText(
                    label: 'Score:',
                    value: '${widget.anime.score} (by ${widget.anime.scoredBy} users)',
                  ),
                  DetailText(label: 'Rating:', value: widget.anime.rating),
                  DetailText(label: 'Rank:', value: widget.anime.rank.toString()),
                  DetailText(
                    label: 'Popularity:',
                    value: widget.anime.popularity.toString(),
                  ),
                  DetailText(
                    label: 'Genres:',
                    value: widget.anime.genres.join(", "),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Synopsis:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.anime.synopsis,
                    style: const TextStyle(fontSize: 16),
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
