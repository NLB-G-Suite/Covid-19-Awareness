import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'LocatiAllow.dart';
import 'PersonalinfoScreen.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class LocatiAllow extends StatefulWidget {
  @override
  _LocatiAllowState createState() => _LocatiAllowState();
}

class _LocatiAllowState extends State<LocatiAllow> {
  Position _currentPosition;
  String latitude;
  String longitude;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          child: Column(children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 7,
          child: Container(
              child: Image.asset(
            'assets/images/location.png',
            height: 800,
            width: 800,
          )),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child:
                        // Text(
                        //   "Allow your Location",
                        //   style: TextStyle(
                        //       color: Colors.deepPurple.shade800,
                        //       fontSize: 25,
                        //       fontWeight: FontWeight.w800),
                        // ),

                        Text(
                            "LAT: $latitude, LNG: $longitude" ?? ''),
                  ),
                Text(
                  "We will need your location to give ",
                  style: TextStyle(
                      color: Colors.deepPurple.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "you better experience.",
                  style: TextStyle(
                      color: Colors.deepPurple.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalinfoScreen()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: new Text(
                      "Yes Sure i'll Do",
                      style: TextStyle(
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                  ),
                  color: Colors.deepPurple.shade100,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    child: Text(
                      "May be later",
                      style: TextStyle(
                          color: Colors.deepPurple.shade700,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalinfoScreen()),
                      );
                      // Navigator.pushNamed(context, "YourRoute");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ])),
    );
  }

  void initPlatformState() {}

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print('this is postion ' + _currentPosition.latitude.toString());
        latitude = _currentPosition.latitude.toString();
        longitude = _currentPosition.longitude.toString();
      });
    }).catchError((e) {
      print(e);
    });
    
  }

  allowLocation() {
    print('Function on Click Event Called.');
    // Put your code here, which you want to execute on onPress event.
  }

  gotonext() {
    print('Function on Click on May be later.');
  }
}
