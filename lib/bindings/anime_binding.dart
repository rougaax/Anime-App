import 'package:get/get.dart';
import 'package:anime_app/controllers/anime_controller.dart';
import 'package:anime_app/services/api_service.dart';

class AnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => AnimeController());
  }
}
