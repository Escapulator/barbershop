import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vintage_barber/Components/reusable_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vintage_barber/Screens/BookingPage.dart';
import 'package:vintage_barber/Screens/NavBar.dart';
import 'package:vintage_barber/Screens/Newspage.dart';
import 'package:vintage_barber/Screens/Productpage.dart';
import 'package:vintage_barber/Screens/Schedulepage.dart';
import 'package:vintage_barber/Screens/TeamPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget PageName;
  _launchURL() async {
    const url = 'https://www.facebook.com/VintageBarbersOxford/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/vintage_barbers_3.png',
          ),
          maxRadius: 29,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
           icon:  Icon(
           Icons.share,),
            onPressed: _launchURL,
      ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            onPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()));
                            },
                            colour: Colors.white,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/list.png',),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  'Booking',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            colour: Colors.white,
                            onPress: _launchURL,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/barber.png',),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),

                                Text(
                                  'Barber Shop',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            colour: Colors.white,
                            onPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPage()));
                            },

                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/group.png',),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  'Team',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: (){
                              PageName = new Newspage();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(PageName)));
                            },
                            colour: Colors.white,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/hairstyle.png',),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),

                                Text(
                                  'Your Style',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              PageName = new Productpage();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(PageName)));
                            },
                            colour: Colors.white,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/product.png',),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text(
                                  'Products',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: (){
                              PageName = new Schedulepage();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(PageName)));
                            },
                            colour: Colors.white,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage(
                                  'assets/images/comb.png'),
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                ),

                                Text(
                                  'Services',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

           ]
        ),
      ),
    );
  }
}
