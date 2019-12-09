import 'package:flutter/material.dart';
import 'package:nbrace/app/braces.dart';
import 'package:nbrace/app/model.dart';
import 'package:nbrace/app/providers.dart';
import 'package:nbrace/app/video.dart';

class Wires extends StatefulWidget {
  final AppVideoProvider videoProvider;
  final AppImageProvider imageProvider;

  Wires(this.videoProvider, this.imageProvider);

  @override
  _WiresState createState() => _WiresState();
}

class _WiresState extends State<Wires> {
  @override
  Widget build(BuildContext context) {
    ImageCategory imageCategory = widget.imageProvider.categories["Wires"];
    VideoCategory videoCategory = widget.videoProvider.categories["Wires"];
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Wires"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.image,
                color: Colors.blueAccent,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.videocam,
                color: Colors.blueAccent,
              ),
            ),
          ]),
        ),
        body: Container(
          child: TabBarView(children: [
            Container(
              child: ListView(
                children: <Widget>[
                  PictureView("Wires", imageCategory.images["Wires"])
                ],
              ),
            ),
            Container(
              child: ListView(
                children: <Widget>[
                  PictureView("Wires", videoCategory.thumbnail),
                  Card(
                    child: ListTile(
                      title: Text("Wire Insertion"),
                      subtitle: Text("Insertion Process of Wires"),
                      trailing: Icon(Icons.play_arrow),
                      onTap: () {
                        String url = videoCategory.videos["Wires"];
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VideoPlayerScreen(url);
                        }));
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      length: 2,
    );
  }
}
