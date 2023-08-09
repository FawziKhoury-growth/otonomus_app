import 'package:flutter/material.dart';
import 'package:task7/models/PropertyModel.dart';
import 'package:task7/service/property_service.dart';

class ListPropertyProvider with ChangeNotifier{
  List<PropertyModel> _listProperty = [];

  PropertyModel? selectedProperty ;

  
  PropertyService service = PropertyService();

  List<PropertyModel> get listProperty => _listProperty;

  void setSelectedProperty(PropertyModel newProperty){
    selectedProperty=newProperty;
    notifyListeners();
  }

  Future<void> setCurrentIndex(AvailableSpace availableSpace, int newIndex) async{
    availableSpace.currentIndex=newIndex;
    notifyListeners();
  }

  Future<void> fetchProperty() async {
    _listProperty=await service.getAllAvailableProperties();
    selectedProperty=_listProperty[0];
    // print(_listProperty.length);

    //   for (int i = 0; i < _listProperty.length; i++) {
    //     print(_listProperty[i].propertyId);
    //   }
    notifyListeners();
  }

} 