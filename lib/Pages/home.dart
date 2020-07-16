import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bg = data['isdaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isdaytime'] ? Colors.orange[900] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/$bg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                   onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location' : result['location'],
                        'isdaytime' : result['isdaytime'],
                        'flag' : result['flag']
                      };
                    });
                   },
                   icon: Icon(
                       Icons.edit_location,
                   color: Colors.white),

                    label: Text(
                        "Edit Location",
                    style: TextStyle(
                      color: Colors.white,
                    )
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                     Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: 2.0
                        )
                      )
                     ],
                  ),

                  SizedBox(height: 20.0),

                  Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 55.0,
                        color: Colors.white,
                )
              )
            ],
        ),
      ),
          )),
    );
  }
}
