import 'package:flutter/material.dart';
import 'package:nbrace/app/about.dart';
import 'package:nbrace/app/braces.dart';
import 'package:nbrace/app/brushing.dart';
import 'package:nbrace/app/developers.dart';
import 'package:nbrace/app/faqs.dart';
import 'package:nbrace/app/providers.dart';
import 'package:nbrace/app/wire.dart';
import 'package:nbrace/app/check.dart';
import 'package:share/share.dart';

class AppHome extends StatelessWidget {
  final AppImageProvider imageProvider = AppImageProvider();
  final AppVideoProvider videoProvider = AppVideoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Frequently Asked Questions"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  Share.share("Checkout new NBrace app on Play Store.\n http://play.google.com/store/apps/details?id=com.nitte.nbrace ",
                      subject: "An App from Nitte ABSMIDS");
                })
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Opacity(
                opacity: 0.85,
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/nitte_logo.png",
                        width: 150,
                      ),
                      Image.asset(
                        "assets/flash_screen.jpg",
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Brushing"),
                subtitle: Text("Cleaning teeth with Braces"),
                leading: Image.asset("assets/icons/brushing.png", width: 30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Brushing(videoProvider);
                  }));
                },
              ),
              ListTile(
                title: Text("Braces"),
                subtitle: Text("Managing Braces"),
                leading: Image.asset("assets/icons/braces.png", width: 30),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Braces(imageProvider);
                  }));
                },
              ),
              ListTile(
                title: Text("Wire"),
                subtitle: Text("Wire Maintainance"),
                leading: Image.asset(
                  "assets/icons/wires.png",
                  width: 30,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Wires(videoProvider, imageProvider);
                  }));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Developers"),
                leading: Image.asset(
                  "assets/icons/developers.png",
                  width: 30,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Developers();
                  }));
                },
              ),
              ListTile(
                title: Text("About"),
                leading: Image.asset(
                  "assets/icons/about.png",
                  width: 30,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return About();
                  }));
                },
              ),
            ],
          ),
        ),
        body: FAQs(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Check();
            }));
          },
          label: Text("Do I need treatment?"),
          autofocus: true,
          backgroundColor: Colors.blueAccent,
        ));
  }
}
