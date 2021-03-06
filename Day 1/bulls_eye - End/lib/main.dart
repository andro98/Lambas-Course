import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bull's Eye",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int randomVariable = 50;
  int score = 0;
  int level = 1;
  int sliderValue = 50;
  static const int number = 100;
  int calcValue;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/Background.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Put the pull eye as close to :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$randomVariable",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 400,
                  child: Slider(
                    value: sliderValue.toDouble(),
                    min: 0,
                    max: 100,
                    activeColor: Colors.green,
                    inactiveColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value.toInt();
                      });
                    },
                  ),
                ),
                Text(
                  "100",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text(
                "Hit ME!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                calcValue = number - (randomVariable - sliderValue).abs();

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Heh",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      "You hit $sliderValue \n and you get score: $calcValue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    actions: [
                      Container(
                        width: 150,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              score = score + calcValue;
                              level++;
                              randomVariable = Random().nextInt(100);
                            });
                          },
                          child: Text(
                            "OK!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Score:$score",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "Level:$level",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
*   int sliderValue = 50;
  int randNumber;
  int score = 0;
  int level = 1;
  int calcScore = 0;
  *
    randNumber = Random().nextInt(100);
    * return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/Background.png")),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Put the Bull's Eye as close as you can to: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "$randNumber",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      width: 500,
                      child: Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.green,
                          inactiveColor: Colors.white,
                          value: sliderValue.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value.toInt();
                            });
                          }),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("assets/img/Button-Normal.png"),
                          fit: BoxFit.cover), // button text
                    ),
                    child: Text(
                      "Hit Me!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    print("hehhhh");
                    calcScore = 100 - (randNumber - sliderValue).abs();
                    score += calcScore;
                    level++;
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          "Ramy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          "You hit $sliderValue \n and you get score:$calcScore",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        actions: [
                          Container(
                            width: 150,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  randNumber = Random().nextInt(100);
                                });
                              },
                              child: Text(
                                "OK!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Score: $score",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 200),
                    Text(
                      "Level: $level",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
*
* */
