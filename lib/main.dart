import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermiseapp/models/air_result.dart';
import 'package:http/http.dart' as http;

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
  final int mappedColor = 0;
  final int mappedStr = 1;

  final TextStyle miseNumberStyle = TextStyle(fontSize: 40);
  final TextStyle mseTextStyle = TextStyle(fontSize: 20);
  final TextStyle miseOtherInfoTextStyle = TextStyle(fontSize: 16);

  AirResult _result;

  Future<AirResult> fetchData() async {
    var response = await http.get(
        'https://api.airvisual.com/v2/nearest_city?key=bc70748e-9b95-4c94-9bb6-e12030dac2e6');
    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  @override
  void initState() {
    super.initState();

    fetchData().then((airResult) {
      setState(() {
        this._result = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '현재 위치의 미세먼지',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: getMappedData(_result)[mappedColor],
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('얼굴사진'),
                                  Text(
                                    '${_result.data.current.pollution.aqius}',
                                    style: miseNumberStyle,
                                  ),
                                  Text(
                                    getMappedData(_result)[mappedStr],
                                    style: mseTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.network(
                                        'https://airvisual.com/images/${_result.data.current.weather.ic}.png',
                                        width: 32,
                                        height: 32,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        '${_result.data.current.weather.tp}',
                                        style: miseOtherInfoTextStyle,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${_result.data.current.weather.hu}%',
                                    style: miseOtherInfoTextStyle,
                                  ),
                                  Text(
                                    '${_result.data.current.weather.ws}m/s',
                                    style: miseOtherInfoTextStyle,
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
                        onPressed: () {
                          setState(() {
                            this._result = null;
                          });
                          fetchData().then((airResult) {
                            setState(() {
                              this._result = airResult;
                            });
                          });
                        },
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

  dynamic getMappedData(AirResult result) {
    final pollutionData = result.data.current.pollution.aqius;

    final mapping = [
      [Colors.greenAccent, "좋음"],
      [Colors.yellow, "보통"],
      [Colors.orange, "나쁨"],
      [Colors.red, "매우 나쁨"],
    ];

    if (pollutionData <= 50) {
      return mapping[0];
    } else if (pollutionData <= 100) {
      return mapping[1];
    } else if (pollutionData <= 150) {
      return mapping[2];
    } else {
      return mapping[3];
    }
  }
}
