import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final TextStyle MiseNumberStyle = TextStyle(fontSize: 40);
  final TextStyle MiseTextStyle = TextStyle(fontSize: 20);
  final TextStyle MiseOtherInfoTextStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '현재 위치의 미세먼지',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.yellow,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('얼굴사진'),
                            Text(
                              '80',
                              style: MiseNumberStyle,
                            ),
                            Text(
                              '보통',
                              style: MiseTextStyle,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('이미지'),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  '11',
                                  style: MiseOtherInfoTextStyle,
                                ),
                              ],
                            ),
                            Text(
                              '습도 100%',
                              style: MiseOtherInfoTextStyle,
                            ),
                            Text(
                              '풍속 5.7m/s',
                              style: MiseOtherInfoTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 50,
                    ),
                    child: Icon(Icons.refresh, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
