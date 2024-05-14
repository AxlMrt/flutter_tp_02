import 'package:flutter/material.dart';
import 'package:monalisa/src/artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});
  final title = "Museum";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.brown),
      home: const ArtworkWidget(),
    );
  }
}
