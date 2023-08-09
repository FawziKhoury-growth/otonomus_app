import 'package:flutter/material.dart';
import 'package:task7/models/CityModel.dart';
import 'package:task7/models/CountryModel.dart';
import 'package:task7/Provider/list_Provider.dart';
import 'package:task7/models/LanguageModel.dart';
import 'package:task7/models/StatesModel.dart';
import 'package:task7/navigator/route_generator.dart';
import 'package:task7/navigator/route_navigator.dart';
import 'package:task7/presentation/screens/DisplayCountry.dart';
import 'package:task7/presentation/shared_widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiate();
  }

  void initiate() async {
    await Provider.of<ListProvider>(context, listen: false).fetchCountry();
    await Provider.of<ListProvider>(context, listen: false).fetchLanguage();
    Provider.of<ListProvider>(context, listen: false).toggleIsLoading();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ListTextStyle =
        TextStyle(fontFamily: 'MontserratMedium', fontSize: 14);
    TextStyle HintTextStyle = TextStyle(
        fontFamily: 'MontserratRegular',
        fontSize: 14,
        color: Color(0xFFB2BBCA));

        TextStyle titleTextStyle = TextStyle(
        fontFamily: 'MontserratRegular',
        fontSize: 10,
        color: Color(0xFF323E48));

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(alignment: Alignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 0.5, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Optional: Border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Country", style: titleTextStyle,),
                    DropdownButton<CountryModel>(
                      underline: Container(),
                      isExpanded: true,
                      hint: Text(
                        "Select Country",
                        style: HintTextStyle,
                      ),
                      value: Provider.of<ListProvider>(context).selectedCountry,
                      onChanged: (CountryModel? newValue) async {
                        await Provider.of<ListProvider>(context, listen: false)
                            .setCountry(newValue);
                      },
                      items: Provider.of<ListProvider>(context)
                          .listCountry
                          .map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.countryName,
                            style: ListTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 0.5, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Optional: Border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State", style: titleTextStyle,),
                    DropdownButton<StateModel>(
                      underline: Container(),
                      hint: Text(
                        "Select State",
                        style: HintTextStyle,
                      ),
                      isExpanded: true,
                      value: Provider.of<ListProvider>(context).selectedState,
                      onChanged: (StateModel? newValue) async {
                        await Provider.of<ListProvider>(context, listen: false)
                            .setState(newValue);
                      },
                      items:
                          Provider.of<ListProvider>(context).listState.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.stateName,
                            style: ListTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 0.5, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Optional: Border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("City", style: titleTextStyle,),
                    DropdownButton<CityModel>(
                      underline: Container(),
                      hint: Text(
                        "Select City",
                        style: HintTextStyle,
                      ),
                      isExpanded: true,
                      value: Provider.of<ListProvider>(context).selectedCity,
                      onChanged: (CityModel? newValue) async {
                        await Provider.of<ListProvider>(context, listen: false)
                            .setCity(newValue);
                      },
                      items:
                          Provider.of<ListProvider>(context).listCity.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.cityName,
                            style: ListTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 0.5, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Optional: Border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Preferred Language", style: titleTextStyle,),
                    DropdownButton<LanguageModel>(
                      underline: Container(),
                      hint: Text(
                        "Select Language",
                        style: HintTextStyle,
                      ),
                      isExpanded: true,
                      value: Provider.of<ListProvider>(context).selectedLanguage,
                      onChanged: (LanguageModel? newValue) async {
                        Provider.of<ListProvider>(context, listen: false)
                            .setLanguage(newValue);
                      },
                      items: Provider.of<ListProvider>(context)
                          .listLanguage
                          .map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.languageDescription,
                            style: ListTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButtonWidget(
                title: "Display Item",
                icon: Icon(Icons.arrow_forward),
                color: Colors.blue,
                TextColor: Colors.white,
                onPressed: () => {
                 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayItem(
                                SelectedCountry:
                                    Provider.of<ListProvider>(context)
                                        .selectedCountry,
                                SelectedState:
                                    Provider.of<ListProvider>(context)
                                        .selectedState,
                                SelectedCity: Provider.of<ListProvider>(context)
                                    .selectedCity,
                                SelectedLanguge:
                                    Provider.of<ListProvider>(context)
                                        .selectedLanguage)),
                      )
                    })
          ],
        ),
        if (Provider.of<ListProvider>(context).isLoading)
          Container(
            color: Colors.black
                .withOpacity(0.5), // Change the color and opacity as needed
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ]),
    );
  }
}
