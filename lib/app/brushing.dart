import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nbrace/app/braces.dart';
import 'package:nbrace/app/model.dart';
import 'package:nbrace/app/providers.dart';
import 'package:nbrace/app/video.dart';
import 'package:url_launcher/url_launcher.dart';

class Brushing extends StatefulWidget {
  final AppVideoProvider videoProvider;

  @override
  _BrushingState createState() => _BrushingState();

  Brushing(this.videoProvider);
}

class _BrushingState extends State<Brushing> {
  @override
  Widget build(BuildContext context) {
    VideoCategory videoCategory = widget.videoProvider.categories["Brushing"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Brushing"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            PictureView("Brushing", videoCategory.thumbnail),
            Card(
              child: ListTile(
                title: Text("Brushing"),
                subtitle: Text("Best Brushing Practices"),
                trailing: Icon(Icons.play_arrow),
                onTap: () {
                  String url = videoCategory.videos["Brushing"];
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoPlayerScreen(url);
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Brushing Braces"),
                subtitle: Text("Method to Brush Braced Teeth"),
                trailing: Icon(Icons.play_arrow),
                onTap: () async {
                  String url = videoCategory.videos["BrushingBraces"];
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoPlayerScreen(url);
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
