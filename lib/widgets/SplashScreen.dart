import 'package:arwa_worker_flutter_project/widgets/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'OnBoardingScreen1.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() async {
      Widget w = GetStorage().read("token") != null ?HomeScreen():OnBoardingScreen1();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => w,));
    },);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)])),
          child: Center(
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
