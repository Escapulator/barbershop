import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vintage_barber/Models/News.dart';
import 'package:vintage_barber/APIConstant.dart';

import '../APIConstant.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context).settings.arguments;
    print(news);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('News Detail',style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05,
          color: Colors.black,
          fontWeight: FontWeight.bold,),),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(APIConstant.DOMAIN + news.image,width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.cover,),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Text(
                  news.title,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    news.description,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
      ),
        )
    )
    );
  }
}



