import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Models/Package.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/Screens/BookingPage.dart';
import 'package:vintage_barber/ViewModel/bookingViewModel.dart';

class BookingPage1 extends StatefulWidget {
  BookingPageState parent;
  @override
  _BookingPage1State createState() => _BookingPage1State();
  BookingPage1(BookingPageState bookingPageState) {
    this.parent = bookingPageState;
  }
}

class _BookingPage1State extends State<BookingPage1> {
  List<Package> allPackages = new List<Package>();
  bookingViewModel bookingVM = new bookingViewModel();

  @override
  initState() {
    super.initState();
    getPackages().then((data) {
      setState(() {
        this.allPackages = data;
        bookingVM.isloading = false;
      });
    });
  }

  Future getPackages() async {
    return await bookingVM.getAllPackages();
  }

  @override
  Widget build(BuildContext context) {
    bool _value = false;
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
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.white,
            child: bookingVM.isloading == false ? ListView.builder(
                itemCount: allPackages.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(allPackages[index].name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Text('£${allPackages[index].price}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,),
                          ),),
                        Expanded(
                          flex: 0,
                          child: Text(" 30 min",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              color: Colors.black,),
                          ),),
                      ],
                    ),
                    subtitle: Text(allPackages[index].description,
                      textHeightBehavior: TextHeightBehavior(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.black,),
                    ),
                    trailing: Checkbox(
                      value: allPackages[index].isSelected,
                      activeColor: Colors.grey,
                      checkColor: Colors.black,
                      onChanged: (value) {
                        widget.parent.setState(() {
                          MyConstant.booking.total = int.parse(allPackages[index].price);
                          MyConstant.booking.serviceId = allPackages[index].id;
                          MyConstant.booking.ServiceName = allPackages[index].name;
                        });
                        setState(() {
                          allPackages.forEach((element) => element.isSelected = false);
                          allPackages[index].isSelected = true;
                        });
                      },
                    ),
                  );
                }
            ) : Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),)
         ),
        ],
      ),
    );
  }
}