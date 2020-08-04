import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollingImageDetailer extends StatelessWidget {

  ScrollingImageDetailer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final key = new GlobalKey<ScaffoldState>();
    Column createContactColumn(IconData icon, String label,
        VoidCallback onPressed) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(icon, color: color), onPressed: onPressed),
            Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(label,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: color)))
          ]);
    }

    return new MaterialApp(
        title: "My FIrst Flutter",
        theme: new ThemeData(primarySwatch: Colors.pink),
        home: new Scaffold(
          backgroundColor: Colors.pink[100],
          appBar: new AppBar(title: new Text("Hello Google!")),
          body: new Container(
              padding: const EdgeInsets.all(32.0),
              child: new LayoutBuilder(
                builder: (BuildContext context,
                    BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(child: new ConstrainedBox(
                      constraints: new BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: new Column(children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'images/lord_shiva_animated_hd_wallpapers.jpg',
                                    height: 240.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                      child: new Text(
                                          'Oeschinen Lake Campground',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0)),
                                  Text(
                                    'Kandersteg, Switzerland',
                                    style: TextStyle(
                                      color: Colors.grey[850],
                                    ),
                                  )
                                ],
                              )),
                          Icon(
                            Icons.star,
                            color: Colors.red[500],
                          ),
                          Text('41')
                        ]),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(10.0),
                          child: new Builder(builder: (context) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  createContactColumn(Icons.call, 'CALL', () {
                                    showSnackBar(context, 'CALL');
                                  }),
                                  createContactColumn(
                                      Icons.near_me, 'ROUTE', () {
                                    showSnackBar(context, 'ROUTE');
                                  }),
                                  createContactColumn(Icons.share, 'SHARE', () {
                                    showSnackBar(context, 'SHARE');
                                  })
                                ]);
                          }),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.' +
                                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                              textAlign: TextAlign.justify,
                              softWrap: true),
                        )
                      ])));
                },
              )),
        ));
  }


  /// This method used to show the SnackBar
  void showSnackBar(BuildContext context, String buttonName) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text('$buttonName button clicked!')));
  }
}