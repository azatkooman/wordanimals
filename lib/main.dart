import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wordanimals/screens/four_animals_screen.dart';

final List<String> imgPath = [
  'assets/images/dog.jpg',
  'assets/images/turtle.jpg',
  'assets/images/bear.jpg',
  'assets/images/swan.jpg'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set landscape orientation
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    return MaterialApp(
      title: 'Wordanimals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'ЖАҢЫ СӨЗДӨРДҮ ЖАТТАЙБЫЗ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgPath
        .map(
          (item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => switchToChosenAnimalCategory(
                            imgPath.indexOf(item),
                          ),
                        ),
                      ),
                      child: Image.asset(item, fit: BoxFit.fill, width: 1000.0),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          animalCategoryReturn(
                            imgPath.indexOf(item),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 9.0,
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 350,
              ),
              items: imageSliders,
            ),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

String animalCategoryReturn(int categoryNumber) {
  switch (categoryNumber) {
    case 0:
      return "ҮЙ ЖАНЫБАРЛАРЫ";
    case 1:
      return "ДЕҢИЗ ЖАНЫБАРЛАРЫ";
    case 2:
      return "ТОКОЙ ЖАНЫБАРЛАРЫ";
    case 3:
      return "КУШТАР";
    default:
      return '';
  }
}

Widget switchToChosenAnimalCategory(int categoryNumber) {
  switch (categoryNumber) {
    case 0:
      return FourAnimals();

    case 1:
      return FourAnimals();
    case 2:
      return FourAnimals();
    case 3:
      return FourAnimals();
    default:
      return FourAnimals();
  }
}
