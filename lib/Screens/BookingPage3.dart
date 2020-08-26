import 'package:flutter/material.dart';
import 'package:vintage_barber/MyConstants.dart';

class BookingPage3 extends StatefulWidget {
  @override
  _BookingPage3State createState() => _BookingPage3State();
}

class _BookingPage3State extends State<BookingPage3> {
  DateTime _dateTime;


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
          Text('Pick up the Date.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Pick a date'),
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050)
                    ).then((date) {
                      setState(() {
                        _dateTime = date;
                        MyConstant.booking.date = _dateTime.toString().split(" ")[0];
                      });
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
