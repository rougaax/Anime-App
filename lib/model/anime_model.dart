class Anime {
  final int malId;
  final String title;
  final String imageUrl;
  final String synopsis;
  final List<String> genres;
  final int episodes;
  final double score;
  final String type;
  final String duration;
  final String status;
  final String aired;
  final String rating;
  final int rank;
  final int popularity;
  final int scoredBy;

  Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.genres,
    required this.episodes,
    required this.score,
    required this.type,
    required this.duration,
    required this.status,
    required this.aired,
    required this.rating,
    required this.rank,
    required this.popularity,
    required this.scoredBy,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    List<String> genreList = [];
    if (json['genres'] != null) {
      genreList =
      List<String>.from(json['genres'].map((genre) => genre['name']));
    }

    return Anime(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      synopsis: json['synopsis'] ?? 'No synopsis available',
      genres: genreList,
      episodes: json['episodes'] ?? 0,
      score: (json['score'] != null) ? json['score'].toDouble() : 0.0,
      type: json['type'] ?? 'Unknown',
      duration: json['duration'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      aired: json['aired']['string'] ?? 'Unknown',
      rating: json['rating'] ?? 'Unknown',
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      scoredBy: json['scored_by'] ?? 0,
    );
  }
}
