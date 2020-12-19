import 'package:animalpreview/api/dogRepository.dart';
import 'package:animalpreview/entity/response.dart';
import 'package:flutter/material.dart';

final repo = DogRepository();
List<Response> dogs = [];
void main() {
  dogObserve();
  runApp(MyApp());
}
void dogObserve() {
  repo.dogController.stream.listen((data) {
    data.forEach((element) {
      dogs.add(element);
    });
  },
      onError: (err) {
        print(err);
      }
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _dogBuild(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          repo.fetchDogs();
          setState(() {});
        },
        tooltip: 'reload',
        child: Icon(Icons.rotate_left),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _dogBuild() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: dogs.length,
      itemBuilder: (BuildContext _context, int i){
        if (dogs.isNotEmpty) {
          return _dogElement(dogs[i]);
        } else {
          return Divider();
        }
      },
    );
  }
  Widget _dogElement(Response dog) {
    return Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: 200,
            height: 200,
            child: Image.network(dog.url),
          ),
        ),
    );
  }
}