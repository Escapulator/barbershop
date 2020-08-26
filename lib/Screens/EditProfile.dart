import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintage_barber/APIConstant.dart';
import 'package:vintage_barber/Models/User.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vintage_barber/Screens/Profilepage.dart';
import 'package:vintage_barber/ViewModel/userViewModel.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user;
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File imageFile = null;
  userViewModel userVM = new userViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = APIConstant.CURRENT_USER;
    user.imageEdit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4b4b4b),
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50,
                            backgroundImage: imageFile == null ? APIConstant.CURRENT_USER.profilePic == "1" ? AssetImage('assets/images/no_image.png') : NetworkImage(APIConstant.DOMAIN + APIConstant.CURRENT_USER.profilePic) : FileImage(File(imageFile.path)),
                          ),
                        ),
                        onTap: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context, scrollController) => Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    //leading: Icon(Icons.camera_alt),
                                    title: Text("Source"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("Camera"),
                                    onTap: _openCamera,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text("Gallery"),
                                    onTap: _openGallery,
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.clear),
                                    title: Text("Cancel"),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
                          !userVM.isloading ? FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            color: Color(0xff282828),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () async {
                              formKey.currentState.save();
                              if(user.name.isEmpty || user.email.isEmpty || user.phone.isEmpty) {
                                showToast("Name, Email and Phone Number cannot be empty.");
                              } else {
                                if (user.cPassword.isEmpty) {
                                  showToast("Current Password is require for saving.");
                                } else {
                                  if(imageFile != null) {
                                    user.imageSrc = File(imageFile.path);
                                    user.imageEdit = true;
                                  }
                                  setState(() {
                                    userVM.isloading = true;
                                  });
                                  await userVM.update(user);
                                  setState(() {
                                    userVM.isloading = false;
                                  });
                                  if(userVM.responseMessage != null) {
                                    setState(() {
                                      user = user;
                                    });
                                    showToast(userVM.responseMessage);
                                    Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => ProfilePage()));
                                  } else {
                                    showToast("Something Wrong!");
                                  }
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ) : CircularProgressIndicator(),
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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (input) {user.name = input;},
                        initialValue: user.name,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Name",
                            fillColor: Colors.white),
                      ),
                      TextFormField(
                        onSaved: (input) {user.email = input;},
                        initialValue: user.email,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Email",
                            fillColor: Colors.white),
                      ),
                      TextFormField(
                        onSaved: (input) {user.phone = input;},
                        initialValue: user.phone,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Phone Number",
                            fillColor: Colors.white),
                      ),
                      TextFormField(
                        obscureText: true,
                        onSaved: (input) {user.password = input;},
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Type password you want to change",
                            fillColor: Colors.white),
                      ),
                      TextFormField(
                        obscureText: true,
                        onSaved: (input) {user.cPassword = input;},
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "current password",
                            fillColor: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _openGallery() async {
    Navigator.of(context).pop();
    final picture = (await _picker.getImage(source: ImageSource.gallery));
    this.setState(() {
      imageFile = File(picture.path);
    });
  }

  _openCamera() async {
    Navigator.of(context).pop();
    final picture = (await _picker.getImage(source: ImageSource.camera));
    this.setState(() {
      imageFile = File(picture.path);
    });
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
