import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:vintage_barber/Screens/LoginPage.dart';
import 'package:vintage_barber/ViewModel/userViewModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Imported Pages

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  User user = new User();
  userViewModel userVM = new userViewModel();
  bool checkBoxValue = false;
  String ConfirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/vintage.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ListView(
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          iconSize: MediaQuery.of(context).size.height * .04,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .04,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * .025,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .045,
                    ),
                    SizedBox(
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          onSaved: (input) {user.name = input;},
                          decoration: InputDecoration(
                            hintText: 'Name',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    SizedBox(
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) {user.email = input;},
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    SizedBox(
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          autofocus: false,
                          onSaved: (input) {user.phone = input;},
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    SizedBox(
                      child: Center(
                        child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          onSaved: (input) {user.password = input;},
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    SizedBox(
                      child: Center(
                        child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          onSaved: (input) {ConfirmPass = input;},
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .01,
                        ),
                        Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        ),
                        Text(
                          'I have read and agreed with',
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * .025,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .01,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms and',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .020,
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .17,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Services',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .020,
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: !userVM.isloading ? FlatButton(
                        textColor: Colors.white,
                        color: Colors.black,
                        child: Text("Sign Up"),
                        onPressed: () async {
                          formKey.currentState.save();
                          if(user.email.isEmpty || user.password.isEmpty || user.phone.isEmpty || user.name.isEmpty || ConfirmPass.isEmpty) {
                            print(user.toJson());
                            showToast("Please fill all the fields");
                          } else {
                            setState(() {
                              userVM.isloading = true;
                            });
                            if (ConfirmPass == user.password) {
                              String result = await userVM.register(user);
                              if(result != "success") {
                                setState(() {
                                  userVM.isloading = false;
                                });
                                showToast(result);
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                            } else {
                              showToast("Password and confirm password should be same.");
                              setState(() {
                                userVM.isloading = false;
                              });
                            }
                          }
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ) : Center(child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * .02,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Log in.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
