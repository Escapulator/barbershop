import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Screens/NavBar.dart';
import 'package:vintage_barber/Screens/Productpage.dart';
import 'package:vintage_barber/ViewModel/orderViewModel.dart';

class OrderDone extends StatefulWidget {
  @override
  _OrderDone createState() => _OrderDone();
}

class _OrderDone extends State<OrderDone> {

  orderViewModel orderVM = new orderViewModel();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(new Productpage())));
      return false;
    },
    child: Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.27,),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: MediaQuery.of(context).size.width * 0.12,
                child: Icon(Icons.check,color: Colors.white,size: MediaQuery.of(context).size.width * 0.15,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              Text("Thank you for Ordering",style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.07),),
              Divider(),
              Text("You can collect your order from our Saloon",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Divider(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
