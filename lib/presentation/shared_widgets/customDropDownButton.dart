import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:task7/Provider/list_Provider.dart';
import 'package:task7/Provider/list_property_provider.dart';
import 'package:task7/models/PropertyModel.dart';
import 'package:provider/provider.dart';
import 'package:svg_icon/svg_icon.dart';

class CustomDropDownButton extends StatelessWidget {
  final String text;
  final String icon;
  final TextStyle hintTextStyle;
  final bool display;
 

  const CustomDropDownButton({Key? key, required this.text, required this.icon, required this.hintTextStyle,required this.display})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    listPropertyProvider? listProvider;
    if(display){
      listProvider=Provider.of<listPropertyProvider>(context, listen: true);
    }
   
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 0.5, // Border width
        ),
        borderRadius: BorderRadius.circular(8.0), // Optional: Border radius
      ),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      width: 300,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child:  SvgIcon(icon),
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: DropdownButton2<PropertyModel>(
              underline: Container(
                height: 1.0,
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.transparent, width: 0.0))),
              ),
              isExpanded: true,
              
              hint: Text(
                text, 
                style: hintTextStyle,
              ),
              value: listProvider?.selectedProperty,
              items: listProvider?.listProperty.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.propertyName, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 12),),
                );
              }).toList(),
              onChanged: (value) {
                listProvider?.setSelectedProperty(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
