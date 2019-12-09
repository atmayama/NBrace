import 'package:flutter/material.dart';
import 'package:nbrace/app/braces.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  int rating = 0;
  int toothType = 1;
  int crooked = 1;
  int forward = 1;

  List<String> choice = ["Yes", "Some What", "Not Very Much", "No"];

  @override
  Widget build(BuildContext context) {
    TextStyle theme = Theme.of(context).textTheme.subhead;

    return Scaffold(
      appBar: AppBar(
        title: Text("Answer the questions"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
            Text(
              "How would you rate your Smile?",
              style: theme,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [1, 2, 3, 4, 5].map((item) {
                  return IconButton(
                    icon: Icon(
                      item <= rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 50.0,
                    ),
                    onPressed: () {
                      setState(() {
                        rating = item;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Divider(
              height: 50,
            ),
            Text(
              "Which Picture Resembles you teeth most?",
              textAlign: TextAlign.center,
              style: theme,
            ),
            PictureView("", Image.asset("assets/Photos/Intro/Intro.jpg")),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: DropdownButton(
                  isExpanded: true,
                  value: toothType,
                  items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toothType = value;
                    });
                  }),
            ),
            Divider(
              height: 50,
            ),
            Text(
              "Do you feel your teeth are crooked?",
              textAlign: TextAlign.center,
              style: theme,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: DropdownButton(
                  isExpanded: true,
                  value: crooked,
                  items: choice.map((item) {
                    return DropdownMenuItem(
                      value: choice.indexOf(item) + 1,
                      child: Text(item.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      crooked = value;
                    });
                  }),
            ),
            Divider(
              height: 50,
            ),
            Text(
              "Do you feel your teeth are forward?",
              textAlign: TextAlign.center,
              style: theme,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: DropdownButton(
                  isExpanded: true,
                  value: forward,
                  items: choice.map((item) {
                    return DropdownMenuItem(
                      value: choice.indexOf(item) + 1,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      forward = value;
                    });
                  }),
            ),
            Builder(builder: (context) {
              return OutlineButton(
                  onPressed: () {
                    if (rating == 0) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Rate Your teeth")));
                      return;
                    }
                    if (toothType == 1 &&
                        crooked != 1 &&
                        crooked != 2 &&
                        forward != 1 &&
                        forward != 2) {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Text(
                                  "Your teeth looks good,\n Happy Smiling.",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (con) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  "We believe that you can benefit from orthodontic treatment.\n\nFeel free to contact us at ABSMIDS for taking the first step to getting that winning smile you always wanted",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          });
                    }
                  },
                  child: Text("Done"));
            })
          ],
        ),
      ),
    );
  }
}
