import 'dart:math';

import 'package:flutter/material.dart';

// import 'package:qweather_icons/qweather_icons.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SearchController searchController = new SearchController();
  @override
  void initState() {
    super.initState();
    print("Init State Called");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("State Set Called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Disposed is called");
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments == null) {
      return Scaffold(
        body: Center(
          child: Text('No data received'),
        ),
      );
    }
    final Map<dynamic, dynamic> information = arguments;
    String iconinfo = information["icons_chng_img"];
    var city_name = [
      "Karachi",
      "Lahore",
      "Faisalabad",
      "Rawalpindi",
      "Multan",
      "Peshawar",
      "Islamabad",
      "Quetta",
      "Sialkot",
      "Gujranwala",
      "Bahawalpur",
      "Sargodha",
      "Sukkur",
      "Larkana",
      "Sheikhupura",
      "Mardan",
      "Kasur",
      "Rahim Yar Khan",
      "Sahiwal",
      "Okara",
      "Wah Cantonment",
      "Dera Ghazi Khan",
      "Mingora",
      "Nawabshah",
      "Mirpur Khas",
      "Chiniot",
      "Kamoke",
      "Burewala",
      "Jhelum",
      "Sadiqabad",
      "Kohat",
      "Jacobabad",
      "Shikarpur",
      "Muzaffargarh",
      "Khanewal",
      "Hafizabad",
      "Lodhran",
      "Malakand",
      "Mandi Bahauddin",
      "Abbottabad",
      "Attock",
      "Dera Ismail Khan",
      "Chaman",
      "Pakpattan",
      "Tando Adam",
      "Vehari",
      "Jaranwala",
      "Muzaffarabad",
      "Swabi",
      "Turbat",
      "Shahdadkot",
      "Kotli",
      "Khuzdar",
      "Dadu",
      "Charsadda",
      "Kharian",
      "Nowshera",
      "Khairpur",
      "Chishtian",
      "Ahmedpur East",
      "Daska",
      "Gojra",
      "Tando Allahyar",
      "Hujra Shah Muqeem",
      "Hasilpur",
      "Jampur",
      "Kandhkot",
      "Karak",
      "Kharan",
      "Khanpur",
      "Kohlu",
      "Kot Addu",
      "Kotli Loharan",
      "Kundian",
      "Lakki Marwat",
      "Layyah",
      "Loralai",
      "Mailsi",
      "Mansehra",
      "Mehar",
      "Mianwali",
      "Miran Shah",
      "Nankana Sahib",
      "Narowal",
      "Naushahro Feroze",
      "Nawabshah",
      "Okara Cantonment",
      "Pasrur",
      "Pattoki",
      "Pishin",
      "Qila Abdullah",
      "Qila Saifullah",
      "Rajanpur",
      "Risalpur Cantonment",
      "Samundri",
      "Sanghar",
      "Shorkot",
      "Sibi",
      "Skardu",
      "Sujawal",
      "Tando Muhammad Khan",
      "Taxila",
      "Thatta",
      "Toba Tek Singh",
      "Umerkot",
      "Upper Dir",
      "Wah Cantonment",
      "Warburton",
      "Wazirabad",
      "Zhob",
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromARGB(255, 118, 205, 245),
                      Color.fromARGB(255, 83, 177, 255)
                    ])),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  hintText: "Search $city",
                                  hintStyle: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "/loading", arguments: {
                                  "cityNameValue": searchController.text
                                });
                              },
                              child: Icon(
                                Icons.search_sharp,
                                color: Colors.black45,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.network(
                                  "https://openweathermap.org/img/wn/$iconinfo@2x.png",
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        information["weather_value"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "sunflower"),
                                      ),
                                      Text(
                                        "in " + information["loc_value"],
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 60,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      information["pressure_value"] + " hPa",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "sunflower"),
                                    ),
                                    Text("Pressure",
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 230,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.thermostat),
                                    Expanded(child: Text("Temperature")),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        information["temp_value"] + "°",
                                        style: TextStyle(
                                            fontSize: 80,
                                            fontFamily: "sunflower"),
                                      ),
                                      Text(
                                        " C",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "sunflower"),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "Feels like " +
                                      information["feel_like"] +
                                      "°C",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.6),
                                      fontFamily: "sunflower"),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(15),
                            //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.water_drop_sharp),
                                    Expanded(child: Text("Humidity"))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        information["hum_value"],
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontFamily: "sunflower"),
                                      ),
                                      Text(
                                        " %",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "sunflower"),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(15),
                            //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.wind_power_sharp),
                                    Expanded(child: Text("Wind Speed"))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        information["wind_value"],
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontFamily: "sunflower"),
                                      ),
                                      Text(
                                        " Km/h",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "sunflower"),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Data from OpenWeatherMap.org",
              style: TextStyle(fontFamily: "sunflower"),
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
