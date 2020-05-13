class AirResult {
  Data data;
  String status;

  AirResult({this.data, this.status});

  AirResult.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String city;
  String country;
  Current current;
  Location location;
  String state;

  Data({this.city, this.country, this.current, this.location, this.state});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['state'] = this.state;
    return data;
  }
}

class Current {
  Pollution pollution;
  Weather weather;

  Current({this.pollution, this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    pollution = json['pollution'] != null
        ? new Pollution.fromJson(json['pollution'])
        : null;
    weather =
    json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pollution != null) {
      data['pollution'] = this.pollution.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather.toJson();
    }
    return data;
  }
}

class Pollution {
  int aqicn;
  int aqius;
  String maincn;
  String mainus;
  String ts;

  Pollution({this.aqicn, this.aqius, this.maincn, this.mainus, this.ts});

  Pollution.fromJson(Map<String, dynamic> json) {
    aqicn = json['aqicn'];
    aqius = json['aqius'];
    maincn = json['maincn'];
    mainus = json['mainus'];
    ts = json['ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aqicn'] = this.aqicn;
    data['aqius'] = this.aqius;
    data['maincn'] = this.maincn;
    data['mainus'] = this.mainus;
    data['ts'] = this.ts;
    return data;
  }
}

class Weather {
  int hu;
  String ic;
  int pr;
  int tp;
  String ts;
  int wd;
  int ws;

  Weather({this.hu, this.ic, this.pr, this.tp, this.ts, this.wd, this.ws});

  Weather.fromJson(Map<String, dynamic> json) {
    hu = json['hu'];
    ic = json['ic'];
    pr = json['pr'];
    tp = json['tp'];
    ts = json['ts'];
    wd = json['wd'];
    ws = json['ws'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hu'] = this.hu;
    data['ic'] = this.ic;
    data['pr'] = this.pr;
    data['tp'] = this.tp;
    data['ts'] = this.ts;
    data['wd'] = this.wd;
    data['ws'] = this.ws;
    return data;
  }
}

class Location {
  List<double> coordinates;
  String type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}
