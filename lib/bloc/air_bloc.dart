import 'dart:convert';

import 'package:fluttermiseapp/models/air_result.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class AirBloc {

  final _airSubject = BehaviorSubject<AirResult>();

  AirBloc() {
//    fetchData().then((value) => _airSubject.add(value));
    fetch();
  }


  Future<AirResult> fetchData() async {
    var response = await http.get(
        'https://api.airvisual.com/v2/nearest_city?key=bc70748e-9b95-4c94-9bb6-e12030dac2e6');
    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  void fetch() async {
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult$ => _airSubject.stream;
}
