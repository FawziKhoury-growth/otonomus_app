import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task7/models/CityModel.dart';
import 'package:task7/models/LanguageModel.dart';
import 'package:task7/models/StatesModel.dart';

import '../models/CountryModel.dart';

class CompleteProfileService{

  Future<List<CountryModel>> getAllCountries() async {
    List<CountryModel> _listCountry = [];
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300"));
      var decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      var result = decodedResponse['data'] as List;
      _listCountry = result.map((map) => CountryModel.fromJson(map)).toList();
      // print(finalResponse.length);

      // for (int i = 0; i < _listCountry.length; i++) {
      //   print(_listCountry[i].countryName);
      // }

      
    } catch (e) {}

    return _listCountry;
  }

  Future<List<StateModel>> getAllStatesByCountryId(String countryid) async {
    String countryId = countryid;
    List<StateModel> _listState = [];
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/country/$countryId/states"));
      var decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      var result = decodedResponse['data'] as List;
      _listState = result.map((map) => StateModel.fromJson(map)).toList();
      // print(finalResponse.length);

      // for (int i = 0; i < _listState.length; i++) {
      //   print(_listState[i].stateName);
      // }

      
    } catch (e) {
      // resetState();
      print("no state found");
    }
    return _listState;
  }

  Future<List<CityModel>> getAllCitiesByStateId(String stateId) async {
    
    List<CityModel> _listCity = [];
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/state/$stateId/cities"));
      var decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      var result = decodedResponse['data'] as List;
      _listCity = result.map((map) => CityModel.fromJson(map)).toList();
      // print(finalResponse.length);
      print('cities : ');
      // for (int i = 0; i < _listCity.length; i++) {
      //   print(_listCity[i].cityName);
      // }

      
    } catch (e) {
      // resetState();
      print("no city found");
    }
    return _listCity;
  }

  Future<List<LanguageModel>> getAllLanguages() async {
    
    List<LanguageModel> _listLanguage = [];
    try {
      var response = await http.get(Uri.parse(
          "http://192.168.88.10:30513/otonomus/common/api/v1/languages?page=0&size=170"));
      var decodedResponse = jsonDecode(response.body);
      // print(decodedResponse);

      var result = decodedResponse['data'] as List;
      _listLanguage = result.map((map) => LanguageModel.fromJson(map)).toList();
      // print(finalResponse.length);
      print('languages : ');
      // for (int i = 0; i < _listLanguage.length; i++) {
      //   print(_listLanguage[i].languageDescription);
      // }

      
    } catch (e) {
      // resetState();
      print("no language found");
    }
    return _listLanguage;
  }

}

  