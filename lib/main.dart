import 'package:flutter/material.dart';
import 'package:gif_gallery_app/screens//home/home.dart';
import 'package:gif_gallery_app/theme/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        title: 'Buscador de Gifs',
        home: Home(),
        theme: CustomAppTheme()
      ),
  );
}
