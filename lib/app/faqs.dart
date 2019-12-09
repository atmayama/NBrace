import 'package:flutter/material.dart';
import 'package:nbrace/app/providers.dart';

import 'model.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    FAQProvider faqProvider = FAQProvider();
    return Container(
      child: FutureBuilder(
          future: faqProvider.getFAQs(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<FAQ> faqs = snapshot.data;
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: 60.0,
                    thickness: 1.0,
                  );
                },
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  FAQ item = faqs[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(item.question),
                    subtitle: Text(
                      item.answer,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (index + 1).toString(),
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return _fqInfo(item);
                          });
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              throw snapshot.error;
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _fqInfo(FAQ item) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      insetAnimationDuration: Duration(seconds: 1),
      insetAnimationCurve: Curves.decelerate,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(12.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.question,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  item.answer,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.justify,
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"))
            ],
          ),
        ),
      ),
    );
  }
}
