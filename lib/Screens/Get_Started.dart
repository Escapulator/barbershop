import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/Screens/Home_page.dart';
import 'package:vintage_barber/Screens/LoginPage.dart';
import 'package:vintage_barber/Screens/Newspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int currentTab = 0;

  Widget currentScreen = Newspage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image:  DecorationImage(
                image:  AssetImage('assets/images/vintage.png'),
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

                      width: 200.0,
                      height: 200.0,
                      decoration:  BoxDecoration(

                        shape: BoxShape.circle,
                        image:  DecorationImage(
                          image:  AssetImage('assets/images/vintage_barbers_3.png'),

                        ),
                      ),

                    )
                  ],
                ),

              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)

                      ),

                      color: Color(0xff282828),
                      textColor: Colors.white,
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        String userData = prefs.getString('user');
                        if(userData == null) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage())
                          );
                        } else {
                          APIConstant.CURRENT_USER = userFromJson(jsonEncode(jsonDecode(userData)['user']));
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => HomePage())
                          );
                        }
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(

                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],

      ),
    );
  }
}
