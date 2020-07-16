import 'package:flutter/material.dart';
import 'package:world_clock/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', loc: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', loc: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', loc: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', loc: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', loc: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', loc: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', loc: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', loc: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', loc: 'Delhi', flag: 'india.png'),
  ];

  void updatetime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location' : instance.loc, 'flag' : instance.flag, 'time': instance.time, 'isdaytime' : instance.isDaytime
    });

  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueGrey,
    appBar: AppBar(
    backgroundColor: Colors.teal,
      title: Text("Choose a Location "),
    centerTitle: true,
    ),
    body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: Card(
          child: ListTile(
            onTap: () { updatetime(index);},
            title: Text(locations[index].loc),
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/${locations[index].flag}'),
          ),
        ),
      ),
    );
    }
  )
  );
  }
  }

