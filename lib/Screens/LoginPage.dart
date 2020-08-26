import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vintage_barber/Screens/Home_page.dart';
import 'package:vintage_barber/Screens/RegisterPage.dart';
import 'package:vintage_barber/ViewModel/userViewModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

//imported pages

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  userViewModel uservm = new userViewModel();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        /// background image
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/vintage.png'),
              fit: BoxFit.cover
          ),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  /// Space above logo
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Row(
                  /// mainAxisAlignment to centre the logo
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      /// logo
                      width: 180.0,
                      height: 180.0,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                          image:  AssetImage('assets/images/vintage_barbers_3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  /// space above 'Welcome'
                  height: MediaQuery.of(context).size.height *.01,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      /// space before 'Welcome'
                      width: MediaQuery.of(context).size.height *.05 ,
                    ),
                    Text('Welcome',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  /// space above 'please login to your account'
                  height: MediaQuery.of(context).size.height *.02,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      /// space before 'Welcome'
                      width: MediaQuery.of(context).size.height *.05 ,
                    ),
                    Text('Please login to your account',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  /// space above the first text field
                  height: MediaQuery.of(context).size.height *.05,
                ),
                SizedBox(
                  /// height and width of textfield
                  height: MediaQuery.of(context).size.height *.06,
                  width: MediaQuery.of(context).size.width *.9,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: emailController,
                    decoration: const InputDecoration(
                        labelText: 'Username or Email',
                        labelStyle: TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white
                          ),
                        ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  /// space above the second text field
                  height: MediaQuery.of(context).size.height *.02,
                ),
                SizedBox(
                  /// height and width of textfield
                  height: MediaQuery.of(context).size.height *.06,
                  width: MediaQuery.of(context).size.width *.9,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: passController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      //fillColor: ,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  ///space above 'Forgot?'
                  height: MediaQuery.of(context).size.height *.01,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      /// size from left of 'forgot?'
                      width : MediaQuery.of(context).size.height *.4,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text('Forgot?',
                          style: TextStyle(
                              color: Colors.white60
                          ),)
                    ),
                  ],
                ),
                SizedBox(
                  /// space below 'Forgot?'
                  height: MediaQuery.of(context).size.height *.06,
                ),
                !uservm.isloading ? SizedBox(
                    height: MediaQuery.of(context).size.height *.07,
                    width: MediaQuery.of(context).size.height *.45,
                    child: OutlineButton(
                      child: Text('Log In',style: TextStyle(color: Colors.white),),
                      onPressed: () async {
                        if(emailController.text.isNotEmpty && passController.text.isNotEmpty) {
                          setState(() {
                            uservm.isloading = true;
                          });
                          await uservm.login(email: emailController.text,password: passController.text);
                          if(uservm.onSuccess != null) {
                            if(uservm.onSuccess) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage())
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Invalid Credentials",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please fill both Email and Password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        setState(() {
                          uservm.isloading = false;
                        });
                      }, //callback when button is clicked
                      borderSide: BorderSide(
                        color: Colors.white, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                    )
                ) : CircularProgressIndicator(),
                SizedBox(
                  /// space above 'Register Now'
                  height: MediaQuery.of(context).size.height *.04,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUp())
                      );
                    },
                    child: Text('Register Now',
                      style: TextStyle(
                          color: Colors.white
                      ),)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
