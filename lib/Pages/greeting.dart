import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';



class Greet extends StatefulWidget {
  @override
  _GreetState createState() => _GreetState();
}



class _GreetState extends State<Greet> {

  @override
    void initState() {
      super.initState();
      Future.delayed(Duration(
        seconds: 5

      ),() {Navigator.pushNamed(context, '/loading');});
    }



  Map gr = {};

  List glist = [
    {'greet' :'INDIA' , 'place' : 'The Gateway of India, Mumbai', 'pic' : 'images/indiag.jpg'},
    {'greet' :'FRANCE',  'place' : ' The Palace of Versailles, Versailles', 'pic' : 'images/franceg.jpg'},
    {'greet' :'SPAIN',  'place' : 'The Basílica de la Sagrada Família, Barcelona', 'pic' : 'images/spaing.jpg'},
    {'greet' :'PORTUGAL',  'place' : 'Belém Tower, Lisbon', 'pic' : 'images/portugalg.jpg'}
    ];

  void glistrandom(){

    gr= glist[ new Random().nextInt(glist.length)];

  }



  @override
  Widget build(BuildContext context) {
    glistrandom();
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(gr['pic']),
          fit: BoxFit.cover,
          )
          ),

          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 620.0, 20.0, 20.0),
            child: Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: null,
                      icon:  Icon(
                      Icons.pin_drop, color: Colors.white,),
                     label: Text(
                    gr['greet'],
                      style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'RobotoSlab-VariableFont_wght.ttf',
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),)
                  )
                ],

              ),

              SizedBox(height: 10.0),

              Text(
              gr['place'],
                  style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'RobotoSlab-VariableFont_wght.ttf',
                  color: Colors.white
              ),
              ),


        ],
      )

    ))));
  }
}
