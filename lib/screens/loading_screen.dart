import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_api/screens/location_screen.dart';
import 'package:weather_api/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_api/services/networking.dart';
import 'package:weather_api/services/weather.dart';

//this is the loading screen where we will wait for our data to get fetched

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getcurrentLocationData();
  }

  void getcurrentLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    //push to the main screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
