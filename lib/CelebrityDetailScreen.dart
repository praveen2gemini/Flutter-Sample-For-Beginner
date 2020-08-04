import 'package:flutter/material.dart';
import 'package:flutter_app/CelebrityItem.dart';
import 'package:flutter_app/model/CelebrityInfo.dart';

// ignore: must_be_immutable
class CelebrityDetailScreen extends StatelessWidget {
  CelebrityInfo info;
  final VoidCallback onPressed;

  CelebrityDetailScreen({Key key, this.info, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal,
        appBar: new AppBar(
          title: new Text("Second Screen"),
        ),
        body: new Align(
          alignment: Alignment.topCenter,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new CelebrityWidget(info: info, isVisible: false),
                new Container(
                    decoration:
                        new BoxDecoration(color: Colors.lightGreenAccent),
                    margin: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                    child: new RaisedButton(
                      padding: const EdgeInsets.all(15.0),
                      onPressed: onPressed,
                      child: new Text('Show Scroll page'),
                    )),
              ]),
        ));
  }
}
//onPressed: () {
//// Navigate back to first screen when tapped!
//Navigator.pop(context);
//}
