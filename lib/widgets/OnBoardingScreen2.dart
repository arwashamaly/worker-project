import 'package:arwa_worker_flutter_project/widgets/OnBoardingScreen3.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen2 extends StatefulWidget {
   OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Image.asset("images/on_boarding_screen2.png",width: 378.61 , height: 356.39),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen3(),));

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
