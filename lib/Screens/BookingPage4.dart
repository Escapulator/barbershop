import 'package:flutter/material.dart';
import 'package:vintage_barber/MyConstants.dart';

class BookingPage4 extends StatefulWidget {
  @override
  _BookingPage4State createState() => _BookingPage4State();
}

class _BookingPage4State extends State<BookingPage4> {
  DateTime _dateTime;
  TimeOfDay _timeOfDay;


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
          Text('Pick up the Time.',
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
                  child: Text('Pick a Time'),
                  onPressed: () {
                    showTimePicker(
                        context: context,
                        initialTime: _timeOfDay == null ? TimeOfDay.now() : _timeOfDay,
                    ).then((value) {
                      _timeOfDay = value;
                      MyConstant.booking.time = (_timeOfDay.hour > 10) ? _timeOfDay.hour.toString() + ":" +_timeOfDay.minute.toString() : '0${_timeOfDay.hour.toString()}' ":" +_timeOfDay.minute.toString();
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
