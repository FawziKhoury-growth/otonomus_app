import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task7/models/CityModel.dart';
import 'package:task7/models/CountryModel.dart';
import 'package:http/http.dart' as http;
import 'package:task7/models/LanguageModel.dart';
import 'package:task7/models/StatesModel.dart';
import 'package:task7/service/CompleteProfileService.dart';

class ListProvider with ChangeNotifier {
  List<CountryModel> _listCountry = [];
  List<StateModel> _listState = [];
  List<CityModel> _listCity = [];
  List<LanguageModel> _listLanguage = [];


  CountryModel? _selectedCountry;
  StateModel? _selectedState ;
  CityModel? _selectedCity;
  LanguageModel? _selectedLanguage;
  bool isLoading = true;

  CompleteProfileService service=CompleteProfileService();

  List<CountryModel> get listCountry => _listCountry;
  List<StateModel> get listState => _listState;
  List<CityModel> get listCity => _listCity;
  List<LanguageModel> get listLanguage => _listLanguage;

  CountryModel? get selectedCountry => _selectedCountry;
  StateModel? get selectedState => _selectedState;
  CityModel? get selectedCity => _selectedCity;
  LanguageModel? get selectedLanguage => _selectedLanguage;

  Future<void> fetchCountry() async {
     _listCountry=await service.getAllCountries();
     notifyListeners();

  }

  Future<void> fetchState(CountryModel? country) async {
    _listState=await service.getAllStatesByCountryId(country!.idCountry);
    notifyListeners();
  }

  Future<void> fetchCity(StateModel? stateModel) async {
    _listCity=await service.getAllCitiesByStateId(stateModel!.idState);
    notifyListeners();
  }

  Future<void> fetchLanguage() async {
    _listLanguage=await service.getAllLanguages();
    notifyListeners();
  }

  

  Future<void> setCountry(CountryModel? newCountry) async{
    toggleIsLoading();
    resetState();
    resetCity();
    _selectedCountry = newCountry;
    await fetchState(newCountry);
    toggleIsLoading();
  }
  
  Future<void> setState(StateModel? newState) async{
    toggleIsLoading();
    resetCity();
    _selectedState = newState;
    notifyListeners();
    await fetchCity(newState);
    toggleIsLoading();
  }
  
  Future<void> setCity(CityModel? newCity) async{
    _selectedCity = newCity;
    notifyListeners();
  }

  void setLanguage(LanguageModel? newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }

  void toggleIsLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  void resetState() {
    _selectedState = null;
    _listState.clear();
  }

  void resetCity(){
    _selectedCity = null;
    _listCity.clear();
  }

 
}
