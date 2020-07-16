import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    GetLocationData();
  }

  void GetLocationData() async
  {
    Location location = new Location();
    await location.GetCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.GetData();
    Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
      (
        child: SpinKitDoubleBounce
        (
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
