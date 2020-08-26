import 'package:flutter/material.dart';
import 'package:vintage_barber/MyConstants.dart';

class BookingPage5 extends StatefulWidget {
  @override
  _BookingPage5State createState() => _BookingPage5State();
}

class _BookingPage5State extends State<BookingPage5> {

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
        Text('Payment Method',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text("PayPal",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.credit_card),
                      Radio(
                        value: "Paypal",
                        groupValue: MyConstant.booking.PayMethod,
                        activeColor: Colors.grey,
                        onChanged: (value) {
                          setState(() {
                            MyConstant.booking.PayMethod = "Paypal";
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text("Credit Card",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.credit_card),
                      Radio(
                        value: "Credit Card",
                        activeColor: Colors.grey,
                        groupValue: MyConstant.booking.PayMethod,
                        onChanged: (value) {
                          setState(() {
                            MyConstant.booking.PayMethod = "Credit Card";
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text("Pay By Cash",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Radio(
                        value: "cash",
                        activeColor: Colors.grey,
                        groupValue: MyConstant.booking.PayMethod,
                        onChanged: (value) {
                          setState(() {
                            MyConstant.booking.PayMethod = "cash";
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
