import 'package:flutter/material.dart';
import 'package:task7/models/CityModel.dart';
import 'package:task7/models/CountryModel.dart';
import 'package:task7/models/LanguageModel.dart';
import 'package:task7/models/StatesModel.dart';

class DisplayItem extends StatefulWidget {
  const DisplayItem(
      {super.key,
      this.SelectedCountry,
      this.SelectedState,
      this.SelectedCity,
      this.SelectedLanguge});

  final CountryModel? SelectedCountry;
  final StateModel? SelectedState;
  final CityModel? SelectedCity;
  final LanguageModel? SelectedLanguge;

  @override
  State<DisplayItem> createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  TextStyle SelectedTextStyle =
      TextStyle(fontFamily: 'MontserratBold', fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Country: ${widget.SelectedCountry == null ? "no selected country" : widget.SelectedCountry!.countryName+"\n id: "+ widget.SelectedCountry!.idCountry}\n",
              style: SelectedTextStyle,
            ),
            Text(
              "State: ${widget.SelectedState == null ? "no selected State" : widget.SelectedState!.stateName+"\n id: "+widget.SelectedState!.idState}\n",
              style: SelectedTextStyle,
            ),
            Text(
              "City: ${widget.SelectedCity == null ? "no selected City" : widget.SelectedCity!.cityName+"\n id: "+widget.SelectedCity!.idCity}\n",
              style: SelectedTextStyle,
            ),
            Text(
              "Language: ${widget.SelectedLanguge == null ? "no selected Language" : widget.SelectedLanguge!.languageDescription+"\n id: "+widget.SelectedLanguge!.idLanguage}\n",
              style: SelectedTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
