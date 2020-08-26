import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vintage_barber/Screens/Get_Started.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => GetStarted())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
      Container(
      decoration: new BoxDecoration(
      image:  DecorationImage(
      image:  AssetImage('assets/images/vt6.jpg',),
      fit: BoxFit.cover,
    ),
    ),
      ),

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                 Container(
                  child: CircularProgressIndicator(),
                   width: 250.0,
                   height: 250.0,
                   decoration:  BoxDecoration(

                     shape: BoxShape.circle,
                     image:  DecorationImage(
                       image:  AssetImage('assets/images/vintage_barbers_3.png'),

                     ),
                   ),

                 ),

                ],
              ),
          ),
        ],
      ),
        ],

      ),
    );
  }
}


