import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Components/HTML/flutter_html.dart';
import 'package:vintage_barber/Components/HTML/html_parser.dart';
import 'package:vintage_barber/Components/HTML/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vintage_barber/ViewModel/aboutusViewModel.dart';


class AboutUsPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<AboutUsPage> {
  String aboutUs;
  aboutusViewModel aboutusVM = new aboutusViewModel();
  @override
  initState() {
    super.initState();
    getAboutUs().then((data) {
      setState(() {
        this.aboutUs = data;
        aboutusVM.isloading = false;
        print(this.aboutUs);
      });
    });
  }

  Future getAboutUs() async {
    return await aboutusVM.getAboutUs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('About Us',style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          color: Colors.black,
          fontWeight: FontWeight.bold,),),
      ),
      body: aboutusVM.isloading == false ? SingleChildScrollView(
        child: Html(
          data: this.aboutUs,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.white,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) async{
            print("Opening $url...");
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ):
      Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
      ),
    );
  }
}



