import 'package:flutter/material.dart';

import '../controller/ApiController.dart';
import '../pojo/Work.dart';
import 'CreateOrderScreen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Image.asset("images/img.png"),
              Positioned(
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
                right: 17,
                top: 20,
              ),
              Positioned(
                child: Image.asset("images/logo.png"),
                top: 15,
                right: 130,
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Select Service",
                      style:
                      TextStyle(color: Color(0xFF0E4DFB), fontSize: 15)),
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<Work>>(
                    future: ApiController().getAllWorks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done &&
                          snapshot.data != null &&
                          snapshot.data!.isNotEmpty) {
                        return GridView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateOrderScreen(snapshot
                                                  .data![index].id!)));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xFFDE1487),
                                          style: BorderStyle.solid,
                                          width: 1)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Image.network(
                                          snapshot.data![index].icon!),
                                      Text(snapshot.data![index].name!,
                                          style: TextStyle(
                                              color: Color(0xFF0E4DFB),
                                              fontSize: 10))
                                    ],
                                  ),
                                )));
                      } else {
                        return Center(
                          child: Text("no data found"),
                        );
                      }
                    },
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
