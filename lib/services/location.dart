import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  var longitude;
  var latitude;

  Future<void> GetCurrentLocation() async
  {
    try
    {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch(e)
    {
      print(e);
    }
  }

}