import 'package:flutter/material.dart';
import 'package:vintage_barber/Models/News.dart';
import 'package:vintage_barber/Repository/newsRepository.dart';
import 'package:vintage_barber/Screens/NewsDetail.dart';
import 'package:vintage_barber/ViewModel/newsViewModel.dart';
import 'package:vintage_barber/APIConstant.dart';

import '../APIConstant.dart';
import '../APIConstant.dart';
import '../APIConstant.dart';

class Newspage extends StatefulWidget {
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<News> allNews = new List<News>();
  newsViewModel newsVM = new newsViewModel();
  String domain = APIConstant.DOMAIN;

  @override
  initState() {
    super.initState();
    getNews().then((data) {
      setState(() {
        this.allNews = data;
        newsVM.isloading = false;
      });
    });
  }

  Future getNews() async {
    return await newsVM.getAllNews();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: newsVM.isloading == false ? SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('News Feed' ,style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              for(var i in allNews) newCard(i),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Trending Haircuts' ,style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Padding(padding: const EdgeInsets.only(left:8.0), child: Text('Cross Fade' ,style: TextStyle(color: Colors.black,fontSize: 18, fontStyle: FontStyle.italic ),),),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Image.network('https://i.imgur.com/LXirJfs.jpg',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Short Tint' ,style: TextStyle(color: Colors.black,fontSize: 18, fontStyle: FontStyle.italic ),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Image.network('https://i.imgur.com/CZflPDI.jpg',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Short Tint' ,style: TextStyle(color: Colors.black,fontSize: 18, fontStyle: FontStyle.italic ),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Image.network('https://i.imgur.com/30nDbyr.jpg',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('High Fade' ,style: TextStyle(color: Colors.black,fontSize: 18, fontStyle: FontStyle.italic ),),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Image.network('https://i.imgur.com/lucVPsH.jpg',
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ):Center(child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
    ),
    ),
    );
  }

  Widget newCard(news) {
    return Card(
      child: ListTile(
          leading: Image.network(domain + news.image,
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.cover,),
          title: Text(news.title),
          subtitle: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: news.description),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>
                    NewsDetail(), settings: RouteSettings(
                    arguments: news)));
          }
      ),
    );
  }
}


