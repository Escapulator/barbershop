import 'package:flutter/material.dart';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/Barber.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/ViewModel/bookingViewModel.dart';

class BookingPage2 extends StatefulWidget {
  @override
  _BookingPage2State createState() => _BookingPage2State();
}

class _BookingPage2State extends State<BookingPage2> {
  List<Barber> allbarbers = new List<Barber>();
  bookingViewModel bookingVM = new bookingViewModel();
  int barberInd = 0;

  @override
  initState() {
    super.initState();
    getBarbers().then((data) {
      setState(() {
        this.allbarbers = data;
        bookingVM.isloading = false;
      });
    });
  }

  Future getBarbers() async {
    return await bookingVM.getAllBarbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Book an appointment (£5 deposit)',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: new Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.grey,),
                  Text('Select\nServices',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),

                ],
              ),
              Container(
                height:MediaQuery.of(context).size.height *  0.002,
                width: MediaQuery.of(context).size.width *  0.05,
                color:Colors.black,),
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.grey,),
                  Text('Select\nBarber',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),

                ],
              ),
              Container(
                height:MediaQuery.of(context).size.height *  0.002,
                width: MediaQuery.of(context).size.width *  0.05,
                color:Colors.black,),
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.grey,),
                  Text('Select\nDate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),

                ],
              ),
              Container(
                height:MediaQuery.of(context).size.height *  0.002,
                width: MediaQuery.of(context).size.width *  0.05,
                color:Colors.black,),
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.grey,),
                  Text('Select\nTime',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),

                ],
              ),
              Container(
                height:MediaQuery.of(context).size.height *  0.002,
                width: MediaQuery.of(context).size.width *  0.05,
                color:Colors.black,),
              Column(
                children: <Widget>[
                  Icon(Icons.check_circle, color: Colors.grey,),
                  Text('Select\nPayment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),

                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.60,
              child: bookingVM.isloading == true ? Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey))) : ListView.builder(
                itemBuilder: (BuildContext ctxt, int index) {
                  index = index * 2;
                  return Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child:  Padding(
                            padding: EdgeInsets.all(5),
                            child: GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: allbarbers[index].isSelected ? Colors.grey[600] : Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage('${APIConstant.DOMAIN}' + allbarbers[index].profilePic),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        allbarbers[index].name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  allbarbers.forEach((element) => element.isSelected = false);
                                  allbarbers[index].isSelected = true;
                                  MyConstant.booking.barber = allbarbers[index].id;
                                  MyConstant.booking.barberName =  allbarbers[index].name;
                                });
                              },
                            ),
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child:  Padding(
                            padding: EdgeInsets.all(5),
                            child: index+1 == allbarbers.length ? Container() :  GestureDetector(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: allbarbers[index+1].isSelected ? Colors.grey[600] : Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage('${APIConstant.DOMAIN}' + allbarbers[index+1].profilePic),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        allbarbers[index+1].name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  allbarbers.forEach((element) => element.isSelected = false);
                                  allbarbers[index+1].isSelected = true;
                                  MyConstant.booking.barber = allbarbers[index+1].id;
                                  MyConstant.booking.barberName =  allbarbers[index+1].name;
                                });
                              },
                            ),
                          )
                      ),
                    ],
                  );
                },
                itemCount: (allbarbers.length / 2).ceil(),
              ),
            ),
            ),
        ],
      ),
    );
  }
}