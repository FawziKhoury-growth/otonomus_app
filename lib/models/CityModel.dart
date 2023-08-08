// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    String idCity;
    String cityName;

    CityModel({
        required this.idCity,
        required this.cityName,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        idCity: json["idCity"],
        cityName: json["cityName"],
    );

    Map<String, dynamic> toJson() => {
        "idCity": idCity,
        "cityName": cityName,
    };
}
