import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vintage_barber/Screens/AppointmentDone.dart';
import 'package:vintage_barber/Screens/BookingPage2.dart';
import 'package:vintage_barber/Screens/Bookingpage5.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'BookingPage1.dart';
import 'BookingPage3.dart';
import 'BookingPage4.dart';

class BookingPage extends StatefulWidget {
  @override
  BookingPageState createState() => BookingPageState();
}


class BookingPageState extends State<BookingPage> {
  int currentTab = 0;
  String msg = "";
  bool isFinish = false;
  List<Widget> screens;
  Widget currentScreen;

  @override
  void initState() {
    MyConstant.booking.time = null;
    MyConstant.booking.PayMethod = null;
    MyConstant.booking.date = null;
    MyConstant.booking.serviceId = null;
    MyConstant.booking.barber = null;
    MyConstant.booking.total = 0;
    super.initState();
    screens = [
      BookingPage1(this),
      BookingPage2(),
      BookingPage3(),
      BookingPage4(),
      BookingPage5(),
    ];
    currentScreen = BookingPage1(this);
  }


  final PageStorageBucket bucket = PageStorageBucket();

  @override
  build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  '£${MyConstant.booking.total}.00 Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.grey[800],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(2.0),
                  onPressed: () {
                    currentTab++;
                    Widget screen = getCurrentScreen();
                    if(currentTab < 6) {
                      if(screen != null) {
                        setState(() {
                          currentScreen = screen;
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg: msg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                  },
                  child: Text(
                    "Next".toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  getCurrentScreen() {
    switch(currentTab) {
      case 1:
        if(MyConstant.booking.serviceId != null)
          return BookingPage2();
        currentTab--;
        msg = "Please Select any Package.";
        return null;
      case 2:
        if(MyConstant.booking.barber != null)
          return BookingPage3();
        currentTab--;
        msg = "Please Select the Barber";
        return null;
      case 3:
        if(MyConstant.booking.date != null)
          return BookingPage4();
        currentTab--;
        msg = "Please Select the Date";
        return null;
      case 4:
        if(MyConstant.booking.time != null)
          return BookingPage5();
        currentTab--;
        msg = "Please Select the Time";
        return null;
      case 5:
        print("MyConstant.booking.PayMethod");
        print(MyConstant.booking.PayMethod);
        if(MyConstant.booking.PayMethod != null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppointmentDone()));
          // thanks for paying Screen
          currentTab++;
          return null;
        }
        currentTab--;
        msg = "Please Select any Payment Method";
        return null;
      default:
        return null;
    }
  }
}



