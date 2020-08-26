import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/vintage_barbers_3.png',
          ),
          maxRadius: 29,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Reserve',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topLeft:  const  Radius.circular(40.0),topRight:  const  Radius.circular(40.0),),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Team',style: TextStyle(color: Colors.white, fontSize: 16),),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height: MediaQuery.of(context).size.height * 0.003,
                width: MediaQuery.of(context).size.width * 0.19,
                color:Colors.white,),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
                child: Image.asset(
                  'assets/images/lady.jpeg',
                  fit: BoxFit.fill,
                ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Text('Claudia',style: TextStyle(color: Colors.white, fontSize: 16),),
           SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Image.asset(
              'assets/images/flag.jpeg',
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.04,
              fit: BoxFit.fill,
            ),
            
        Center(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
