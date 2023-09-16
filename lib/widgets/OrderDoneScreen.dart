import 'package:flutter/material.dart';

class OrderDoneScreen extends StatefulWidget {
  OrderDoneScreen({Key? key}) : super(key: key);

  @override
  State<OrderDoneScreen> createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            // إغلاق الشاشة
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset("images/order.png"),
          SizedBox(
            height: 30,
          ),
          Text(
            "ORDER DONE!",
            style: TextStyle(fontSize: 24, color: Color(0xff0E4DFB)),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "The ORDER has been sent. A technician will \n contact you",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xff272727)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 55,
            width: 255,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF346EDF),
                      Color(0xFF6CC3F9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'GO TO HOME',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
