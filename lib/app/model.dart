import 'package:flutter/widgets.dart';

class FAQ {
  String question;
  String answer;
  bool expanded = false;

  FAQ(this.question, this.answer);
}

class ImageCategory {
  String name;
  Map<String, Image> images = {};

  ImageCategory(this.name);

  void add(String key, Image image) {
    images[key] = image;
  }
}

class VideoCategory {
  String name;
  Image thumbnail;
  Map<String, String> videos = {};

  VideoCategory(this.name, this.thumbnail);

  void add(String key, String video) {
    videos[key] = video;
  }
}
