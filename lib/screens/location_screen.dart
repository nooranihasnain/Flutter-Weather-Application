import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  var temperature;
  var conditionNumber;
  var cityName;
  String weatherIcon;
  String weatherMessage;
  WeatherModel model = new WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.locationWeather);
  }

  void UpdateUI(dynamic weatherData)
  {
    setState(() {
      if(weatherData == null)
      {
        temperature =0;
        weatherIcon = "Error";
        cityName = "City not found";
        weatherMessage = "Unable to get weather";
        return;
      }
       temperature = weatherData['main']['temp'];
       conditionNumber = weatherData['weather'][0]['id'];
       cityName = weatherData['name'];
       weatherIcon = model.getWeatherIcon(conditionNumber);
       weatherMessage = model.getMessage(temperature);
    });
  }

  void GetCityWeather(String cityname) async
  {
    NetworkHelper networkHelper = new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.GetData();
    UpdateUI(weatherData);
  }

  void ReloadData() async
  {
    Location location = new Location();
    await location.GetCurrentLocation();
    NetworkHelper networkHelper = new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.GetData();
    UpdateUI(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(model.getBackground(conditionNumber)),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      ReloadData();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedCityName = await Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return CityScreen();
                      }));
                      if(typedCityName != null)
                      {
                        GetCityWeather(typedCityName);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding
              (
                padding: EdgeInsets.only(left: 0.0, right:0.0, top:0.0, bottom:200.0),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$temperature°',
                  style: kTempTextStyle,
                ),
                Text(
                  weatherIcon,
                  style: kConditionTextStyle,
                ),
              ],
              ),
              Center(
                child: Text(
                  '$cityName',
                  style: kCityNameTextStyle,
                ),
              ),
              Center(
                child: Text(
                  weatherMessage,
                  style: kCityNameTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
