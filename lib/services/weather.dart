class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getBackground(int condition)
  {
    if (condition < 300) {
      return 'images/cloudy.jpg';
    } else if (condition < 400) {
      return 'images/rainy.jpg';
    } else if (condition < 600) {
      return 'images/rainy.jpg';
    } else if (condition < 700) {
      return 'images/snowy.jpg';
    } else if (condition < 800) {
      return 'images/windy.jpg';
    } else if (condition == 800) {
      return 'images/sunny.jpg';
    } else if (condition <= 804) {
      return 'images/cloudy.jpg';
    } else {
      return 'images/location_background.jpg';
    }
  }
}
