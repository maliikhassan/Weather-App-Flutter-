import 'package:flutter/material.dart';
import 'package:weather_app/essentials/getDetails.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

String getTemp = "Loading...";
String getWeather = "Loading...";
String getHumidity = "Loading...";
String getWind = "Loading...";
String getPressure = "Loading...";
String cityName = "Mianwali, PK";
String icn_img = "Loading...";
String get_feel_like = "Loading...";

class _LoadingState extends State<Loading> {
  void startApp() async {
    Getdetails instance1 = Getdetails(location: cityName);
    await instance1.getCoordinates();
    await instance1.getDataWeather();
    Future.delayed(const Duration(seconds: 2), () {
      // print(instance1.temperature);
      // print(instance1.weather);
      // print(instance1.humidity);
      // print(instance1.description);
      // print(instance1.windSpeed);
      // print(instance1.pressure);
      setState(() {
        getTemp = instance1.temperature;
        getWeather = instance1.weather;
        getWind = instance1.windSpeed;
        getHumidity = instance1.humidity;
        icn_img = instance1.icon_img;
        getPressure = instance1.pressure;
        get_feel_like = instance1.feel_like;
      });
      getTemp = instance1.temperature;
      getWeather = instance1.weather;
      getWind = instance1.windSpeed;
      getHumidity = instance1.humidity;
      icn_img = instance1.icon_img;
      getPressure = instance1.pressure;
      get_feel_like = instance1.feel_like;

      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value": getTemp,
        "weather_value": getWeather,
        "wind_value": getWind,
        "hum_value": getHumidity,
        "loc_value": cityName,
        "icons_chng_img": icn_img,
        "pressure_value": getPressure,
        "feel_like": get_feel_like
      });
      print("okok");
    });
  }

  @override
  void initState() {
    print("Init State is called");
    super.initState();
    startApp();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("Init setState is called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Init Dispose is called");
  }

  @override
  Widget build(BuildContext context) {
    //setState(() {});
    Map searching = ModalRoute.of(context)?.settings.arguments as Map;

    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Map) {
      final Map<dynamic, dynamic> searching = arguments;
      if (searching.isNotEmpty) {
        cityName = searching["cityNameValue"];
        startApp();
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(31, 218, 170, 170),
                    spreadRadius: 4,
                    blurRadius: 10)
              ], borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "images/logo1.png",
                height: 170,
                width: 170,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Weather App",
              style: TextStyle(fontSize: 30, fontFamily: "sunflower"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Loading weather . . ."),
            SizedBox(height: 20),
            SpinKitWave(
              color: Colors.black,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
