class Response {
  final String url;

  Response({this.url});

  List<Response> makeResponseList(List<String> list) {
    List<Response> dogs = [];
    list.forEach((element) {
      dogs.add(Response(url: element));
    });
    return dogs;
  }
}