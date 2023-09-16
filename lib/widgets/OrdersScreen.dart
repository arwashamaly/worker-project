import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            color: Color(0xFF0E4DFB),
            child: Center(
              child: Text(
                "Item Details",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("Order #52001",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: 145,),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("28 Nov 2019",style: TextStyle(fontSize: 12,color: Colors.grey)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 2,bottom: 15),
                            child: Text("Service Type:",style: TextStyle(fontSize: 12,color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text("Carpenter",style: TextStyle(fontSize: 12,color: Colors.blueAccent)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )
    ;
  }
}
