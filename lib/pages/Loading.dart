import 'package:flutter/material.dart';
import 'package:project01/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    WorldTime worldTimeInstance =
        WorldTime(location: 'Kolkata', flag: "india.jpg", url: 'Asia/Kolkata');
    await worldTimeInstance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "time": worldTimeInstance.time,
        "location": worldTimeInstance.location,
        "flag": worldTimeInstance.flag,
        "isDayTime": worldTimeInstance.isDayTime
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}
