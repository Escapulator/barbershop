import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Models/CartItems.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vintage_barber/MyConstants.dart';
import 'package:vintage_barber/Screens/PaymethodPage.dart';
import 'package:vintage_barber/Screens/Productpage.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreen createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {

  getTotal() {
    int total = 0;
    for (var cartItem in MyConstant.cart) {
      total = total + cartItem.pamount;
    }
    setState(() {
     MyConstant.order.pamount = total;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
            title: Text('My Cart',
                style: TextStyle(color: Colors.black, fontSize: 22)),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Productpage()));
              },
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              for (var cartItem in MyConstant.cart) getCartItem(cartItem),
              ListTile(
                title: Text(
                  "Total:",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                trailing: Text(
                  '£${MyConstant.order.pamount}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () {
                    if(MyConstant.order.pamount > 0) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Paymethodpage()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please add product in cart to proceed.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getCartItem(CartItem cartItem) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
              trailing: Container(
                width: MediaQuery.of(context).size.width * 0.10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      MyConstant.cart.removeWhere((item) => item.id == cartItem.id);
                      MyConstant.allproducts.forEach((product) {
                          if(cartItem.pid == product.id) {
                            product.quantity = 1;
                          }
                        });
                    });
                    getTotal();
                  },
                  child: Icon(Icons.clear,
                  color: Colors.white,),
            ),
          )),
          ListTile(
            title: Text(
              cartItem.title,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            trailing: Text(
              '£${cartItem.pamount}',
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          ListTile(
              title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(cartItem.quantity > 1) {
                          cartItem.quantity--;
                          MyConstant.allproducts.forEach((product) {
                            if(cartItem.pid == product.id) {
                              product.quantity--;
                              product.price = product.quantity * product.updated_price;
                              cartItem.pamount = cartItem.quantity * product.updated_price;
                            }
                          });
                        }
                      });
                      getTotal();
                    },
                    child: Icon(Icons.remove,
                      color: Colors.white,),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                cartItem.quantity.toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ))),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        cartItem.quantity++;
                        MyConstant.allproducts.forEach((product) {
                          if(cartItem.pid == product.id) {
                            product.quantity++;
                            product.price = product.quantity * product.updated_price;
                            cartItem.pamount = cartItem.quantity * product.updated_price;
                        }
                        });
                      });
                      getTotal();
                    },
                    child: Icon(Icons.add,
                      color: Colors.white,),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(),
              )
            ],
          )),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
