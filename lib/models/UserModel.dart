// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    String idUser;
    String firstName;
    String lastName;
    String email;

    UserModel({
        required this.idUser,
        required this.firstName,
        required this.lastName,
        required this.email,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["idUser"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
    };
}
