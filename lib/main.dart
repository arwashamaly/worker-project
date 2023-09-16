import 'package:arwa_worker_flutter_project/widgets/CustomerRegisterScreen.dart';
import 'package:arwa_worker_flutter_project/widgets/HomeScreen.dart';
import 'package:arwa_worker_flutter_project/widgets/CustomerLoginScreen.dart';
import 'package:arwa_worker_flutter_project/widgets/OrderDoneScreen.dart';
import 'package:arwa_worker_flutter_project/widgets/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}


