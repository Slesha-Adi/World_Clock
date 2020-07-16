import 'package:flutter/material.dart';
import 'package:world_clock/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



 void setupworldTime() async {
   WorldTime instance = WorldTime(loc: 'Berlin',
       flag: 'https://www.google.com/search?q=german+flag&rlz=1C1CHBF_enIN853IN853&sxsrf=ALeKk01OmgcoJUHE0cyPSSL8sMaHJfW7Iw:1594544374942&tbm=isch&source=iu&ictx=1&fir=AxGulA5YpEQGmM%252Chr0hpZMrkMGl8M%252C_&vet=1&usg=AI4_-kT3vtF_VL1lmgYP546Om-dtTY2a7g&sa=X&ved=2ahUKEwjg7K_YrMfqAhWc4zgGHSmEAswQ_h0wAHoECAYQBA#imgrc=AxGulA5YpEQGmM',
       url: 'Europe/Berlin');
   await instance.getData();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location' : instance.loc, 'flag' : instance.flag, 'time': instance.time, 'isdaytime' : instance.isDaytime
   });
 }

  @override
  void initState() {
    super.initState();
    setupworldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(

        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
        )
    );
  }
}
