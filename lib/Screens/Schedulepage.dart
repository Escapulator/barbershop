import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Booking.dart';
import 'package:vintage_barber/ViewModel/bookingViewModel.dart';

class Schedulepage extends StatefulWidget {
  @override
  _SchedulepageState createState() => _SchedulepageState();
}

class _SchedulepageState extends State<Schedulepage> {
  bookingViewModel bookingVM = new bookingViewModel();
  List<Booking> allbookings = new List<Booking>();
  List<String> monthNames = ["Jan", "Feb", "Mar", "April", "May", "June",
    "July", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  @override
  initState() {
    super.initState();
    bookingVM.getAllBookings().then((data) {
      setState(() {
        this.allbookings = data;
        bookingVM.isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('My Appointments'),
          bottom: TabBar(
            indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: 'UPCOMING',
                ),
                Tab(
                  text: 'PREVIOUS',
                ),
              ],
          ),
      ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.grey[800],
              child: bookingVM.isloading == false ? Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: allbookings.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(monthNames[DateTime.parse(allbookings[index].date).month - 1]+" "+DateTime.parse(allbookings[index].date).day.toString(),style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text(allbookings[index].time,
                                      style: TextStyle(
                                          color: Colors.white,)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                     child: CircleAvatar(
                                       radius: 25,
                                       backgroundImage: NetworkImage('${APIConstant.DOMAIN}' + allbookings[index].hair_staff.profilePic),
                                       backgroundColor: Colors.transparent,
                                     ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: ListTile(
                                          title: Text(
                                            allbookings[index].hair_package.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          subtitle: Text(
                                            allbookings[index].hair_staff.name,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ) : Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              ),
            ),
            Container(
              color: Colors.grey[800],
              child: Center(child: Text(""))
            ),
          ],
        ),
      ),
    );
  }
}
