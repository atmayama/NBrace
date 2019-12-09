import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbrace/app/model.dart';
import 'package:nbrace/app/providers.dart';

class Braces extends StatefulWidget {
  final AppImageProvider imageProvider;

  Braces(this.imageProvider);

  @override
  _BracesState createState() => _BracesState();
}

class _BracesState extends State<Braces> {
  @override
  Widget build(BuildContext context) {
    ImageCategory imageCategory = widget.imageProvider.categories["Braces"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Braces"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            PictureView(
                "Types of Braces", imageCategory.images["Types of Braces"]),
            PictureView(
                "Lingual Braces", imageCategory.images["Lingual Braces"]),
            PictureView(
                "Clear Alighners", imageCategory.images["Clear Alighners"]),
            PictureView("Metal Braces", imageCategory.images["Metal Braces"]),
          ],
        ),
      ),
    );
  }
}

class PictureView extends StatelessWidget {
  final String name;
  final Image image;

  PictureView(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            fit: StackFit.passthrough,
            children: <Widget>[
              ShaderMask(
                blendMode: BlendMode.darken,
                child: image,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black54,
                        Colors.white,
                        Colors.white,
                      ]).createShader(bounds);
                },
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
