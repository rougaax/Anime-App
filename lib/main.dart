import 'package:flutter/material.dart';
import 'package:anime_app/screens/anime_list_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jikan Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AnimeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}