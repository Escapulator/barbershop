import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Screens/EditProfile.dart';
import 'package:vintage_barber/Screens/ContactUsPage.dart';
import 'package:vintage_barber/Screens/AboutUsPage.dart';
import 'package:vintage_barber/Screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(left:35.0, top:110.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50,
                          backgroundImage: APIConstant.CURRENT_USER.profilePic == "1" ? AssetImage('assets/images/no_image.png') : NetworkImage(APIConstant.DOMAIN + APIConstant.CURRENT_USER.profilePic),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            APIConstant.CURRENT_USER.name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            APIConstant.CURRENT_USER.email,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            ),
                            color: Color(0xff282828),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditProfile()));
                            },
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ],
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('10', style: TextStyle(color: Colors.white),),
                          Text('Services', style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Padding(
                        padding:EdgeInsets.only(left:60.0, right:50.0),
                        child:Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.002,
                          color:Colors.white,),),
                      Column(
                        children: <Widget>[
                          Text('5', style: TextStyle(color: Colors.white),),
                          Text('Orders', style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      Padding(
                        padding:EdgeInsets.only(left:60.0, ),
                        child:Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.002,
                          color:Colors.white,),),
                    ],
                  ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                                    Icon(Icons.description, size: 25,),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                                    Text('About Us', style: TextStyle(color: Colors.black, fontSize: 16),),

                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Container(
                                  height: 1.0,
                                  width: double.infinity,
                                  color:Colors.grey,),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                                    Icon(Icons.location_on, size: 25,),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                                    Text('Contact Us', style: TextStyle(color: Colors.black, fontSize: 16),),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Container(
                                  height: 1.0,
                                  width: double.infinity,
                                  color:Colors.grey,),
                              ),
                              InkWell(onTap: () async{
                                // TODO delete shared preference
                                SharedPreferences preferences = await SharedPreferences.getInstance();
                                preferences.remove('user');
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                 },
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                                    Icon(Icons.power_settings_new, size: 25,),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                                    Text('Logout', style: TextStyle(color: Colors.black, fontSize: 16),),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                      )),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
