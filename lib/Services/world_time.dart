
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String loc;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.loc, this.url, this.flag});

  Future<void> getData() async {
    try {
      Response response = await get(
          'https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print("caught error $e");
      time="Unexpected error";
    }


  }
}