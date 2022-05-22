import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:just_audio/just_audio.dart';

final List<String> imgPath = [
  'assets/images/dog.jpg',
  'assets/images/turtle.jpg',
  'assets/images/bear.jpg',
  'assets/images/swan.jpg'
];

late AudioPlayer player;

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
                Image.asset(item, fit: BoxFit.fill, width: 1000.0),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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

class FourAnimals extends StatefulWidget {
  @override
  _FourAnimalsState createState() => _FourAnimalsState();
}

class _FourAnimalsState extends State<FourAnimals> {
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset('assets/sounds/farm/dog.mp3');
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('ҮЙ ЖАНЫБАРЛАРЫН ЖАТТАЙБЫЗ'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                onPageChanged: _onPageViewChange,
                enlargeCenterPage: true,
                height: 350,
              ),
              items: imageSliders,
            ),
          )
        ],
      ),
    );
  }
}

String animalCategoryReturn(int categoryNumber) {
  switch (categoryNumber) {
    case 0:
      return "ИТ";
    case 1:
      return "ТАШ БАКА";
    case 2:
      return "АЮУ";
    case 3:
      return "АК КУУ";
    default:
      return '';
  }
}

_onPageViewChange(int page, CarouselPageChangedReason reason) async {
  await player.setAsset('assets/sounds/farm/dog.mp3');
  player.play();
  print(page);
}
