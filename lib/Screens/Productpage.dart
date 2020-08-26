import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Models/CartItems.dart';
import 'package:vintage_barber/ViewModel/productViewModel.dart';
import '../APIConstant.dart';
import '../MyConstants.dart';
import 'CartScreen.dart';

class Productpage extends StatefulWidget {
  @override
  _ProductpageState createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {

  productViewModel productVM = new productViewModel();

  @override
  initState() {
    super.initState();
    if(MyConstant.allproducts.length == 0) {
      getProducts().then((data) {
        setState(() {
          MyConstant.allproducts = data;
          productVM.isloading = false;
        });
      });
    } else {
      setState(() {
        productVM.isloading = false;
      });
    }
  }
  Future getProducts() async {
    return await productVM.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    final url = APIConstant.CONTENT_URL;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Products'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search Products...",
                  ),
                ),
              )
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width * 0.98,
                height: MediaQuery.of(context).size.height * 0.65,
                child: productVM.isloading == false ? ListView.builder(
                  itemCount: MyConstant.allproducts.length,
                  itemBuilder: (BuildContext ctxt, int index){
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.network(url+MyConstant.allproducts[index].image,
                            width: MediaQuery.of(context).size.width * 0.20,
                            height: MediaQuery.of(context).size.height * 0.20,
                          ),
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(MyConstant.allproducts[index].title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text('£${MyConstant.allproducts[index].price}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              color: Colors.white,),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    child: new IconButton(
                                      // padding : new EdgeInsets.fromLTRB(0, 0, 200, 50),
                                      //padding: new EdgeInsets.all(40),
                                      color: Colors.white,
                                      icon: new Icon(Icons.remove, size: 20.0),
                                      onPressed: (){
                                        setState(() {
                                          if(MyConstant.allproducts[index].quantity > 1){
                                            MyConstant.allproducts[index].quantity --;
                                            MyConstant.allproducts[index].price = MyConstant.allproducts[index].quantity * MyConstant.allproducts[index].updated_price;
                                          }
                                        });
                                      },
                                      //  onPressed: onDelete,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(MyConstant.allproducts[index].quantity.toString(),
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.08,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: new IconButton(
                                    //  padding : new EdgeInsets.fromLTRB(0, 0, 200, 50),
                                      color: Colors.white,
                                      icon: new Icon(Icons.add, size: 20.0),
                                      // backgroundColor: Colors.white,
                                      onPressed: (){
                                        setState(() {
                                          MyConstant.allproducts[index].quantity++;
                                          MyConstant.allproducts[index].price = MyConstant.allproducts[index].quantity * MyConstant.allproducts[index].updated_price;
                                        });
                                      }
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                ),
                              ),
                            ],
                          ),
                          trailing: FloatingActionButton(
                            heroTag: "Btn"+index.toString(),
                            onPressed: () async {
                              CartItem cartitem = new CartItem(DateTime.now().toString(),MyConstant.allproducts[index].title,MyConstant.allproducts[index].quantity,MyConstant.allproducts[index].price,MyConstant.allproducts[index].id);
                              var cart = MyConstant.cart.firstWhere((cartItem) => cartItem.pid == MyConstant.allproducts[index].id, orElse: () => null);
                              setState(() {
                                if (cart == null){
                                  MyConstant.cart.add(cartitem);
                                }else{
                                  print("cardid"+cart.id);
                                  MyConstant.cart.removeWhere((item) => item.id == cart.id);
                                  cartitem.quantity = cartitem.quantity + cart.quantity;
                                  cartitem.pamount = cartitem.pamount + cart.pamount;
                                  MyConstant.cart.add(cartitem);
                                }
                              });
                            },
                            child: Icon(Icons.shopping_cart, color: Colors.grey[700],),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 3,
                        ),
                      ],
                    );
                  },
                ): Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "CartBtn",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CartScreen())
          );
          // Add your onPressed code here!
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Icon(Icons.shopping_cart, color: Colors.white,),
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.023,
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              child: Text(
                MyConstant.cart.length.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

  }
}
