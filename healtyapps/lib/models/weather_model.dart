// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        status: json["status"] == null ? null : json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  String city;
  String state;
  String country;
  Location location;
  Current current;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "location": location == null ? null : location.toJson(),
        "current": current == null ? null : current.toJson(),
      };
}

class Current {
  Current({
    required this.weather,
    required this.pollution,
  });

  Weather weather;
  Pollution pollution;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        weather: Weather.fromJson(json["weather"]),
        pollution: Pollution.fromJson(json["pollution"]),
      );

  Map<String, dynamic> toJson() => {
        "weather": weather == null ? null : weather.toJson(),
        "pollution": pollution == null ? null : pollution.toJson(),
      };
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  DateTime ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;

  factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
        ts: DateTime.parse(json["ts"]),
        aqius: json["aqius"] == null ? null : json["aqius"],
        mainus: json["mainus"] == null ? null : json["mainus"],
        aqicn: json["aqicn"] == null ? null : json["aqicn"],
        maincn: json["maincn"] == null ? null : json["maincn"],
      );

  Map<String, dynamic> toJson() => {
        "ts": ts == null ? null : ts.toIso8601String(),
        "aqius": aqius == null ? null : aqius,
        "mainus": mainus == null ? null : mainus,
        "aqicn": aqicn == null ? null : aqicn,
        "maincn": maincn == null ? null : maincn,
      };
}

class Weather {
  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  DateTime ts;
  int tp;
  int pr;
  int hu;
  double ws;
  int wd;
  String ic;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        ts: DateTime.parse(json["ts"]),
        tp: json["tp"] == null ? null : json["tp"],
        pr: json["pr"] == null ? null : json["pr"],
        hu: json["hu"] == null ? null : json["hu"],
        ws: json["ws"] == null ? null : json["ws"].toDouble(),
        wd: json["wd"] == null ? null : json["wd"],
        ic: json["ic"] == null ? null : json["ic"],
      );

  Map<String, dynamic> toJson() => {
        "ts": ts == null ? null : ts.toIso8601String(),
        "tp": tp == null ? null : tp,
        "pr": pr == null ? null : pr,
        "hu": hu == null ? null : hu,
        "ws": ws == null ? null : ws,
        "wd": wd == null ? null : wd,
        "ic": ic == null ? null : ic,
      };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] == null ? null : json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates.map((x) => x)),
      };
}
