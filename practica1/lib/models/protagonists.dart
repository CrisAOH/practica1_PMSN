import 'package:flutter/material.dart';

class ImageProtagonist {
  ImageProtagonist(
    this.image,
    this.color,
  );
  final String image;
  final Color color;
}

class Protagonist {
  Protagonist(
    this.videogame,
    this.name,
    this.description,
    this.enemies,
    this.allies,
    this.listImage,
  );
  final String videogame;
  final String name;
  final String description;
  final String enemies;
  final String allies;
  final List<ImageProtagonist> listImage;
}
