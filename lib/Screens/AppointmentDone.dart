import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:vintage_barber/Screens/NavBar.dart';
import 'package:vintage_barber/Screens/Newspage.dart';
import 'package:vintage_barber/Screens/PayPalAppointment.dart';
import 'package:vintage_barber/ViewModel/bookingViewModel.dart';

class AppointmentDone extends StatefulWidget {
  @override
  _AppointmentDone createState() => _AppointmentDone();
}

class _AppointmentDone extends State<AppointmentDone> {

  bookingViewModel bookVM = new bookingViewModel();

  @override
  initState() {
    super.initState();
    bookVM.addBooking().then((data) {
      if(MyConstant.booking.PayMethod != "cash") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => PaypalPaymentAppointment(
              onFinish: (number) async {
                setState(() {
                  bookVM.isloading = false;
                });
              },
            ),
          ),
        );
      } else {
        setState(() {
          bookVM.isloading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bookVM.isloading ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.width * 0.12,
                  child: Icon(Icons.check,color: Colors.white,size: MediaQuery.of(context).size.width * 0.15,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                Text("Thank you for choosing us",style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.07),),
                Text("We'll see you on appointment day",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Divider(),
                Text("Appointment Summary",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                DottedBorder(
                  strokeCap: StrokeCap.round,
                  dashPattern: [25, 4],
                  strokeWidth: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("Time"),
                          leading: Icon(Icons.timer),
                          trailing: Text(MyConstant.booking.time+", "+MyConstant.booking.date.split(" ")[0],style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        ListTile(
                          title: Text("Service"),
                          leading: Icon(Icons.card_giftcard),
                          trailing: Text(MyConstant.booking.ServiceName,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        ListTile(
                          title: Text("Barber Name"),
                          leading: Icon(Icons.person),
                          trailing: Text(MyConstant.booking.barberName,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        ListTile(
                          title: Text("Payment"),
                          leading: Icon(Icons.payment),
                          trailing: Text("£"+MyConstant.booking.total.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                RaisedButton(
                  color: Colors.grey[800],
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(new Newspage())));
                  },
                  child: Center(child: Text("DONE", style: TextStyle(color: Colors.white,fontSize: 20),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
