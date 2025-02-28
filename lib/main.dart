import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/screens/anime_list_screen.dart';
import 'package:anime_app/screens/anime_detail_screen.dart';
import 'package:anime_app/services/api_service.dart';

void main() {
  Get.put(ApiService());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jikan Anime App',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.white,
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AnimeListScreen()),
        GetPage(name: '/details', page: () => AnimeDetailScreen(anime: Get.arguments)),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
