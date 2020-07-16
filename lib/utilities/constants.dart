import 'package:flutter/material.dart';

const apiKey = '3ba3e808d6a8d6053fa25d5b51caa693';

const kTextFieldInputDecoration = InputDecoration
(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white,),
  hintText: 'Enter City name',
  hintStyle: TextStyle
  (
    color: Colors.grey,
  ),
  border: OutlineInputBorder
  (
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  )
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kCityNameTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
  fontWeight: FontWeight.w100
);