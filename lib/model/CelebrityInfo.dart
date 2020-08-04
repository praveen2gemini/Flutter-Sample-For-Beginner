import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class CelebrityInfo {
  String name;
  String company;
  String country;
  String url;
  int dateTime;

  CelebrityInfo(
      {this.name, this.company, this.country, this.url, this.dateTime});

  factory CelebrityInfo.fromJson(Map<String, dynamic> jsonResponse) {
    return new CelebrityInfo(
        name: jsonResponse['name'] as String,
        company: jsonResponse['company'] as String,
        country: jsonResponse['country'] as String,
        url: jsonResponse['url'] as String,
        dateTime: jsonResponse['dateTime'] as int);
  }

  static Future<List<CelebrityInfo>> fetchCelebritiesDetails() async {
    String resp = await loadAsset();
//    final jsonResponse = jsonDecode(resp);
    debugPrint('CelebrityInfo.fromJsonResponse resp: $resp');
    Map<String, dynamic> decoded = json.decode(resp);
//    debugPrint('decoded value is $decoded');
    List<CelebrityInfo> celebs = new List<CelebrityInfo>();
    for (var celeb in decoded['celebrities']) {
      CelebrityInfo info = new CelebrityInfo(
          name: celeb['name'] as String,
          company: celeb['company'] as String,
          country: celeb['country'] as String,
          url: celeb['url'] as String,
          dateTime: celeb['dateTime'] as int);
      celebs.add(info);
    }
    return celebs;
  }

  static Future<String> loadAsset() async {
    return await rootBundle
        .loadString("lib/sample_response/celebrity_mock_response.json");
  }

  factory CelebrityInfo.fromJsonResponse(BuildContext context) {
    new FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('lib/sample_response/celebrity_mock_response.json'),
        builder: (context, celebrityInfo) {
          var data = json.encode(celebrityInfo.data.toString());
          var dataLength = data.length;
          debugPrint('CelebrityInfo.fromJsonResponse data: $data');
          debugPrint('CelebrityInfo.fromJsonResponse data_length: $dataLength');
          debugPrint(
              'CelebrityInfo.fromJsonResponse loadAsset(): $loadAsset()');
          return new Container();
        });
    return null;
//    return new CelebrityInfo(
//        name: jsonResponse['name'] as String,
//        company: jsonResponse['company'] as String,
//        country: jsonResponse['country'] as String,
//        url: jsonResponse['url'] as String,
//        dateTime: jsonResponse['dateTime'] as int);
  }
}
