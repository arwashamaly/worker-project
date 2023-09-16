import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              Image.asset("images/img_9.png"),
              Positioned(
                child: Text(
                  "More",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                top: 20,
                right: 170,
              )
            ],
          ),
          ListTile(
              title: Text(
                "Change Password",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "FAQ's",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "About App",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "Terms & Conditions",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "Rate App",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          ListTile(
              title: Text(
                "Delete Account",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              )),
          SizedBox(
            height: 195,
          )
        ])),
      ),
    );
  }
}
