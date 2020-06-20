import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inovola_task/models/Trip.dart';
import 'package:inovola_task/ui/splash_screen.dart';
import 'package:inovola_task/ui/trip_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //check the api json to get the data and convert the date to arabic date to be formatted
  Future<Trip> getData() async {
    var response = await http
        .get('http://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34');
    if (response != null) {
      //If the server did return a 200 OK response,
      //then parse the JSON.
      Trip trip = Trip.fromJson(json.decode(response.body));
      if (trip.dateTime != null) {
        await initializeDateFormatting('ar_EG', null);
        var format = DateFormat.yMMMEd('ar').add_jm();
        DateTime tripDate = DateTime.parse(trip.dateTime.toString());
        trip.arabicDate = format.format(tripDate).toString();
      }

      return trip;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<Trip> snapshot) {
        switch (snapshot.connectionState) {
          // Getting Data
          case ConnectionState.waiting:
            return SplashScreen();
          case ConnectionState.none:
            return SplashScreen(message: "Check internet Connection");
          default:
            //  return Container();
            return snapshot.hasData
                ? TripScreen(snapshot.data)
                : SplashScreen(message: "Check internet Connection");
        }
      },
    );
  }
}
