import 'package:dio/dio.dart';
import 'package:anime_app/model/anime_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.jikan.moe/v4/top/anime';
  final Dio _dio = Dio();

  Future<List<Anime>> fetchAnimeList({int page = 1}) async {
    try {
      final response = await _dio.get(baseUrl, queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> animeList = data['data'];
        return animeList.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat anime');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
