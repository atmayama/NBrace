import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nbrace/app/model.dart';

class FAQProvider {
  Future<List<FAQ>> getFAQs(BuildContext context) async {
    List<FAQ> faqs = [];
    Map faqMap = jsonDecode(await DefaultAssetBundle.of(context)
        .loadString("assets/questions.json"));
//    log(faqMap.toString());

    faqMap.forEach((key, value) {
      faqs.add(FAQ(key, value));
    });
    return faqs;
  }
}

class AppImageProvider {
  Map<String, ImageCategory> categories = {};

  AppImageProvider() {
    load();
  }

  void load() async {
    ImageCategory imageCategory = ImageCategory("Braces");
    imageCategory.add("Types of Braces",
        Image.asset("assets/Photos/TypesOfBraces/Types.jpg"));
    imageCategory.add("Lingual Braces",
        Image.asset("assets/Photos/TypesOfBraces/Lingual.jpg"));
    imageCategory.add(
        "Metal Braces", Image.asset("assets/Photos/TypesOfBraces/Metal.jpg"));
    imageCategory.add("Clear Alighners",
        Image.asset("assets/Photos/TypesOfBraces/ClearAlighners.jpg"));
    categories["Braces"] = imageCategory;
    imageCategory = ImageCategory("Wires");
    imageCategory.add("Wires", Image.asset("assets/Photos/Wires/Wires.jpg"));
    categories["Wires"] = imageCategory;
  }
}

class AppVideoProvider {
  Map<String, VideoCategory> categories = {};

  AppVideoProvider() {
    load();
  }

  void load() async {
    VideoCategory category = VideoCategory(
        "Brushing", Image.asset("assets/Video/HowToBrushTeeth/thumbnail.png"));
    category.add("Brushing", "assets/Video/HowToBrushTeeth/Brushing.mp4");
    category.add(
        "BrushingBraces", "assets/Video/HowToBrushTeeth/BrushingBraces.mp4");
    categories["Brushing"] = category;
    category =
        VideoCategory("Wires", Image.asset("assets/Video/Wires/thumbnail.png"));
    category.add("Wires", "assets/Video/Wires/WiresInsertion.mp4");
    categories["Wires"] = category;
  }
}
