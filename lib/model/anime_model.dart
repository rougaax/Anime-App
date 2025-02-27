class Anime {
  final int malId;
  final String title;
  final String imageUrl;
  final String synopsis;

  Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      synopsis: json['synopsis'] ?? 'No synopsis available',
    );
  }
}