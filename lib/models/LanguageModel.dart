// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
    String idLanguage;
    String languageCode;
    String languageDescription;

    LanguageModel({
        required this.idLanguage,
        required this.languageCode,
        required this.languageDescription,
    });

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        idLanguage: json["idLanguage"],
        languageCode: json["languageCode"],
        languageDescription: json["languageDescription"],
    );

    Map<String, dynamic> toJson() => {
        "idLanguage": idLanguage,
        "languageCode": languageCode,
        "languageDescription": languageDescription,
    };
}
