import 'dart:async';

import 'package:animalpreview/api/dogClient.dart';
import 'package:animalpreview/entity/response.dart';

class DogRepository {
  // ignore: close_sinks
  final dogController = StreamController<List<Response>>();
  final dogClient = DogClient();
  void fetchDogs() {
    dogClient.fetchArticle().then((response) => {
      dogController.sink.add(response)
    });
  }
}