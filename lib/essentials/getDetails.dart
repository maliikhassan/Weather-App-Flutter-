import 'dart:convert';

import 'package:http/http.dart';

class Getdetails {
  late String location;
  double latitude1;
  double longitude1;
  Getdetails(
      {required this.location, this.latitude1 = 0, this.longitude1 = 0}) {
    location = this.location;
  }

  String temperature = "";
  String humidity = "";
  String windSpeed = "";
  String pressure = "";
  String weather = "";
  String description = "";
  String errMsg = "";
  String icon_img = "";
  String feel_like = "";

  Future<void> getCoordinates() async {
    final response = await get(Uri.parse(
        'https://api.openweathermap.org/geo/1.0/direct?q=$location&limit=7&appid=cb699b0b93efd4bf21f7ef114b30b848'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      // Assuming you want to extract the first occurrence of "lat" and "lon"
      double lat = data[0]['lat'];
      double lon = data[0]['lon'];

      latitude1 = lat;
      longitude1 = lon;

      print('Latitude: $lat, Longitude: $lon');
    } else {
      throw Exception('Failed to load location data');
    }
    //   try {
    //     Uri uri = Uri.parse(
    //         "https://api.openweathermap.org/geo/1.0/direct?q=$location&limit=7&appid=cb699b0b93efd4bf21f7ef114b30b848");
    //     Response response = await get(uri);
    //     final data = jsonDecode(response.body);
    //     if (data.length > 1) {
    //       latitude1 = data[1]["lat"];
    //       longitude1 = data[1]["lon"];
    //     } else {
    //       errMsg = "Invalid Location";
    //     }
    //   } catch (e) {
    //     errMsg = "Invalid Location";
    //   }
  }

  Future<void> getDataWeather() async {
    getCoordinates();
    if (errMsg == "Invalid Location") {
      temperature = "--";
      humidity = "--";
      windSpeed = "--";
      pressure = "--";
      weather = "--";
      description = "--";
      icon_img = "03n";
    } else {
      Uri uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude1&lon=$longitude1&appid=cb699b0b93efd4bf21f7ef114b30b848");
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      List weather_data = data["weather"];
      Map get_weather_data = weather_data[0];
      weather = get_weather_data["description"].toString();
      description = get_weather_data["description"].toString();
      icon_img = get_weather_data["icon"];

      Map get_temp = data["main"];
      temperature = ((get_temp["temp"] - 273).toString().substring(0, 4));
      feel_like = ((get_temp["feels_like"] - 273).toString().substring(0, 4));
      humidity = get_temp["humidity"].toString();
      pressure = get_temp["pressure"].toString();
      Map get_Wind = data["wind"];
      windSpeed =
          ((get_Wind["speed"] / 0.2777777778).toString().substring(0, 4));
      print(icon_img);
      print(icon_img);
      print(icon_img);
    }
  }
}
