import 'package:flutter/material.dart';
import 'package:task7/Provider/list_property_provider.dart';
import 'package:task7/models/PropertyModel.dart';
import 'package:task7/presentation/shared_widgets/customDropDownButton.dart';
import 'package:task7/presentation/shared_widgets/display_card.dart';
import 'package:task7/presentation/shared_widgets/side_drawer.dart';
import 'package:provider/provider.dart';
import 'package:svg_icon/svg_icon.dart';
import 'DisplayCountry.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    initiate();
  }

  void initiate() async {
    await Provider.of<listPropertyProvider>(context, listen: false)
        .fetchProperty();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    listPropertyProvider listProvider =
        Provider.of<listPropertyProvider>(context, listen: true);
    TextStyle HintTextStyle =
        TextStyle(fontFamily: "MontserratRegular", fontSize: 12);
    return Scaffold(
      key: _scaffoldKey,
      drawer: sideDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          toolbarHeight: 160,
          backgroundColor: Color(0xFF3C4955),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: ()=>{_scaffoldKey.currentState?.openDrawer()}, icon: SvgIcon(
                    'assets/icon/menu_icon.svg',
                    color: Colors.white,
                  ),),
                  
                  SizedBox(
                    width: 25,
                  ),
                  CustomDropDownButton(
                    text: "Select Property",
                    icon: 'assets/icon/PropertyIcon.svg',
                    hintTextStyle: HintTextStyle,
                    display: true,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomDropDownButton(
                      text: "Select Dates",
                      icon:
                          'assets/icon/calenderIcon.svg',
                      hintTextStyle: HintTextStyle,
                      display: false,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: CustomDropDownButton(
                      text: "Guests & Rooms",
                      icon:
                          'assets/icon/PropertyIcon.svg', 
                      hintTextStyle: HintTextStyle,
                      display: false,
                    ),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
          child: ListView(children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 0, 5),
                child: Text(
                  'Available spaces',
                  style: TextStyle(
                      color: Color(0xFF323E48),
                      fontFamily: 'MontserratMedium',
                      fontSize: 16),
                )),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listProvider.selectedProperty == null
                    ? 1
                    : listProvider.selectedProperty!.availableSpaces.length,
                itemBuilder: (context, index) {
                  return DisplayCard(
                      availableSpace: listProvider
                          .selectedProperty?.availableSpaces[index]);
                }),
          ]),
        ));
  }
}
