import 'package:flutter/material.dart';

import 'OnBoardingScreen2.dart';

class OnBoardingScreen1 extends StatefulWidget {
   OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Image.asset("images/on_boarding_screen1.jpeg",width: 378.61 , height: 356.39),
              Text("Fast reservation with technicians and craftsmen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Color(0xff0E9CF9)),textAlign: TextAlign.center,),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 55,
                width: 305,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen2(),));

                  }, child: Text("NEXT",style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
