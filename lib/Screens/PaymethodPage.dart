import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vintage_barber/Models/Order.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/Screens/OrderDone.dart';
import 'package:vintage_barber/Screens/PaypalPayment.dart';
import 'package:vintage_barber/ViewModel/orderViewModel.dart';

class Paymethodpage extends StatefulWidget {
  @override
  _Paymethodstate createState() => _Paymethodstate();
}

class _Paymethodstate extends State<Paymethodpage> {
  orderViewModel order = new orderViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Payment', style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Payment Method",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
              Card(
                child: ListTile(
                  title: Text("PayPal",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  trailing: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.credit_card),
                        Radio(
                          value: "PayPal",
                          activeColor: Colors.black,
                          groupValue: MyConstant.order.paymethod,
                          onChanged: (value) {
                            setState(() {
                              MyConstant.order.paymethod = "PayPal";
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Pay by Card",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  trailing: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.credit_card),
                        Radio(
                          value: "Pay by Card",
                          activeColor: Colors.black,
                          groupValue: MyConstant.order.paymethod,
                          onChanged: (value) {
                            setState(() {
                              MyConstant.order.paymethod = "Pay by Card";
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Pay By Cash",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  trailing: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        Radio(
                          value: "cash",
                          activeColor: Colors.black,
                          groupValue: MyConstant.order.paymethod,
                          onChanged: (value) {
                            setState(() {
                              MyConstant.order.paymethod = "cash";
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              !order.isloading ? Container(
                  width: MediaQuery.of(context).size.width,
                  child :  RaisedButton(
                    color: Colors.black,
                    onPressed: () async {
                       BuildContext oldContext =context;
                      if(MyConstant.order.paymethod == 'cash') {
                        final result = await order.addOrder();
                        if(result ==  "success") {
                          MyConstant.order = new Order(pamount:0, paymethod: "cash");
                          MyConstant.cart.clear();
                          MyConstant.allproducts.forEach((product) {
                              product.quantity = 1;
                              product.price = product.updated_price;
                          });
                          navigateToCompletePage(oldContext);
                        } else {
                          Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      } else {
                        // navigate to payPal page.
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {
                                // payment done
                                //print('order id: ' + number);
                                if (number != null && number != "") {
                                  final result = await order.addOrder();
                                  if(result ==  "success") {
                                    MyConstant.order = new Order(pamount:0, paymethod: "cash");
                                    MyConstant.cart.clear();
                                    MyConstant.allproducts.forEach((product) {
                                      product.quantity = 1;
                                      product.price = product.updated_price;
                                    });
                                  }
                                  print(result);
                                  return result;
                                } else {
                                  return "Fail";
                                }
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text('Amount Payable £${MyConstant.order.pamount}', style: TextStyle(
                          color: Colors.white),),
                      trailing: Text('Pay ➯', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06,
                          color: Colors.white),),
                    ),
                  ),
              ) : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  navigateToCompletePage(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderDone()));
  }
}
