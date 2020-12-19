import 'dart:io';

import 'package:animalpreview/entity/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DogClient {
  Future<List<Response>> fetchArticle() async {
    final url = 'https://dog.ceo/api/breeds/image/random/10';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      final List<String> jsonArray = getDogList(map['message']);
      return Response().makeResponseList(jsonArray);
    } else {
      throw Exception('Failed to load article');
    }
  }
  List<String> getDogList(data) {
    List<String> _dogInfo = [];
    for (int i = 0; i < data.length; i++) {
      _dogInfo.add(data[i] as String);
    }
    return _dogInfo;
  }
}