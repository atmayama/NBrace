import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Developers"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Guide",
              style: Theme.of(context).textTheme.subhead,
            ),
            Profile("Dr. Roshan Fernandes",
                AssetImage("assets/Profiles/Roshan.jpg"), ""),
            Divider(),
            Text("Developers", style: Theme.of(context).textTheme.subhead),
            Profile(
                "Sushanth Kille",
                AssetImage("assets/Profiles/Sushanth.jpg"),
                "https://github.com/hashslash"),
            Profile("Rahul D Shetty", AssetImage("assets/Profiles/Rahul.jpg"),
                "https://github.com/rahuldshetty"),
            Profile(
                "Reevan Mario Miranda",
                AssetImage("assets/Profiles/Reevan.jpg"),
                "https://github.com/rmm98"),
            Spacer(),
            OutlineButton(
              onPressed: () async {
                String url = "mailto:sushanthkille@gmail.com?subject=NBrace";
                if (await canLaunch(url)) {
                  launch(url);
                }
              },
              child: Text("Report Bug or Provide feedback"),
            )
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final ImageProvider pic;
  final String url;

  Profile(this.name, this.pic, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: ListTile(
          title: Text(name),
          leading: CircleAvatar(
            backgroundImage: pic,
          ),
          trailing: url.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () async {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Cannot Launch, Try Manually:$url")));
                    }
                  })
              : null,
        ),
      ),
    );
  }
}
