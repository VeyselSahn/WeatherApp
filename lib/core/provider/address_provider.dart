import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:location/location.dart';

class AddressProvider extends ChangeNotifier {
  String address = '';
  bool loading = false;
  bool isSearch = false;

  void setAddress(String newAddress) {
    address = newAddress;
    notifyListeners();
  }

  Future<void> getAddress() async {
    changeLoading(true);
    Location location = Location();

    var _locationData = await location.getLocation();
    final coordinates =
        Coordinates(_locationData.latitude, _locationData.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setAddress(addresses.first.subAdminArea ?? 'London');
    changeLoading(false);
  }

  void changeLoading(bool newLoad) {
    loading = newLoad;
    notifyListeners();
  }

  void changeBar() {
    isSearch = !isSearch;
    notifyListeners();
  }
}
