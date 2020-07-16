import 'package:flutter/material.dart';
import 'package:world_clock/Pages/choose_location.dart';
import 'package:world_clock/Pages/greeting.dart';
import 'package:world_clock/Pages/home.dart';
import 'package:world_clock/Pages/loading.dart';

void main() =>runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Greet(),
    '/loading':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation(),

  },
));



