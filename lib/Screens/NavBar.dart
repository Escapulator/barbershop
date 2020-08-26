import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vintage_barber/Screens/BookingPage.dart';
import 'package:vintage_barber/Screens/Newspage.dart';
import 'package:vintage_barber/Screens/Productpage.dart';
import 'package:vintage_barber/Screens/Profilepage.dart';
import 'package:vintage_barber/Screens/Schedulepage.dart';

class NavBar extends StatefulWidget {
  Widget currentScreen;
  NavBar(@required this.currentScreen);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int currentTab = 0;
  final List<Widget> screens = [
    Newspage(),
    Schedulepage(),
    Productpage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: widget.currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff282828),
        child: Icon(Icons.content_cut, color: Colors.white,),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookingPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffE5E5E5),
        shape: CircularNotchedRectangle(),

        notchMargin: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        widget.currentScreen =
                            Newspage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.description,
                          color:  Color(0xff282828),
                        ),
                        Text(
                          'News',
                          style: TextStyle(
                            color:  Color(0xff282828),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        widget.currentScreen =
                            Schedulepage(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Color(0xff282828),
                        ),
                        Text(
                          'Schedule',
                          style: TextStyle(
                            color: Color(0xff282828),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        widget.currentScreen =
                            Productpage(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.category,
                          color:  Color(0xff282828),
                        ),
                        Text(
                          'Product',
                          style: TextStyle(
                            color:  Color(0xff282828),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        widget.currentScreen =
                            ProfilePage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.perm_identity,
                          color:  Color(0xff282828),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color:  Color(0xff282828),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
