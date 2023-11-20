// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'dart:async';

class ShinChanChar {
  final String id;
  String? imageUrl;
  String? apiname;
  String? nativename;
  String? fullname;

  int rating = 10;

  ShinChanChar(this.id);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      apiname = id;

      var uri = Uri.https('65527b4d5c69a779032a16a5.mockapi.io', '/api/shinchan/characters/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      Map<String, dynamic> data = json.decode(responseBody);
      imageUrl = data["imageUrl"];
      nativename = data["nativename"];
      fullname = data["name"];

      //print(levelDigimon);
    } catch (exception) {
      //print(exception);
    }
  }
}
