import 'package:flutter/material.dart';
import 'package:flutter_app/model/CelebrityInfo.dart';
import 'package:flutter_app/CelebrityDetailScreen.dart';
import 'package:flutter_app/ScrollingImageDetailer.dart';

// ignore: must_be_immutable
class CelebrityWidget extends StatelessWidget {
  CelebrityInfo info;
  bool isVisible;
  CelebrityWidget({Key key, this.info, this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('@@@@@@' + info.name);
    return new Card(
      color:  Theme.of(context).primaryColorLight,
        elevation: 5.0,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Column(children: <Widget>[
                    new Text(info.name,
                        style:
                            new TextStyle(color: Colors.green, fontSize: 25.0)),
                    new Text(info.company,
                        style: new TextStyle(color: Colors.deepOrange)),
                    new Text(info.country,
                        style: new TextStyle(color: Colors.blue)),
                    new Image.network(info.url),
                    new Container(
                        decoration:
                            new BoxDecoration(color: Colors.lightGreenAccent),
                        margin: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                        child: new Text(getCurrentDateTimeNow(info.dateTime),
                            style: new TextStyle(
                                fontWeight: FontWeight.w900,
                                // The most thick
                                color: Colors.redAccent),
                            textAlign: TextAlign.justify)),
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.black12, shape: BoxShape.circle),
                          child: isVisible ? new IconButton(
                              iconSize: 48.0,
                              highlightColor: Colors.green,
                              icon: new Icon(Icons.navigate_next),
                              color: Colors.deepOrange,
                              splashColor: Colors.brown,
                              tooltip: 'Refresh',
                              onPressed: () {
//                              showSnackBar(context);
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            new CelebrityDetailScreen(
                                                info: info,
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                          new ScrollingImageDetailer()));
//                                                  Navigator.pop(context);
                                                })));
                              }) : new Container()///Empty container if isVisible flag false
                      ),
                    )
                  ]))
            ]));
  }
//  onPressed: () {
//  Navigator.pop(context);
//  }
  /// It gives current Date and Time
  String getCurrentDateTimeNow(int millisecondsSinceEpoch) {
//    var now = new DateTime.now();
    var now = new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    debugPrint('CurrentDateTimeNow: $now');
    String value = now.day.toString() +
        "/" +
        now.month.toString() +
        "/" +
        now.year.toString();
    return value;
  }

  /// This method used to show the SnackBar
  void showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text('Refresh button clicked!')));
  }
}
