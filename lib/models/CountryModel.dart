// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    String idCountry;
    String countryName;
    String countryCode;
    String isoCode2;
    String isoCode3;

    CountryModel({
        required this.idCountry,
        required this.countryName,
        required this.countryCode,
        required this.isoCode2,
        required this.isoCode3,
    });

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        idCountry: json["idCountry"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        isoCode2: json["isoCode2"],
        isoCode3: json["isoCode3"],
    );

    Map<String, dynamic> toJson() => {
        "idCountry": idCountry,
        "countryName": countryName,
        "countryCode": countryCode,
        "isoCode2": isoCode2,
        "isoCode3": isoCode3,
    };
}
