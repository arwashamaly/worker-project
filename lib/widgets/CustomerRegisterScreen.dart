import 'package:arwa_worker_flutter_project/pojo/ApiResponse.dart';
import 'package:arwa_worker_flutter_project/pojo/User.dart';
import 'package:flutter/material.dart';

import '../controller/ApiController.dart';
import 'CustomerLoginScreen.dart';
import 'HomeScreen.dart';

class CustomerRegisterScreen extends StatefulWidget {
  CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  bool flag = true;
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 489,
              width: double.infinity,
              child: DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xFF346EDF),
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              text: 'Service provider',
                            ),
                            Tab(
                              text: 'Customer',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Text('...')),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          controller: _nameTextController,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF346EDF)),
                                            ),
                                            hintText: 'Full Name',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          controller: _emailTextController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF346EDF)),
                                            ),
                                            hintText: 'Email',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          controller: _phoneTextController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF346EDF)),
                                            ),
                                            hintText: 'Phone',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          controller: _passwordTextController,
                                          obscureText: true,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                                Icons.remove_red_eye_outlined),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigoAccent),
                                            ),
                                            hintText: 'Password',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            filled: true,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                                Icons.arrow_drop_down_outlined),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF346EDF)),
                                            ),
                                            hintText: 'Select service',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: flag,
                                              onChanged: (value) {
                                                setState(() {
                                                  flag = value!;
                                                });
                                              },
                                              shape: CircleBorder(),
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF346EDF)),
                                              checkColor: Colors.white,
                                            ),
                                            Text(
                                              "I Read and Accept Home Service Terms & Conditions",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Have Account?",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomerLoginScreen()));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Text(
                                                      "SIGN IN",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xFF346EDF),
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              height: 60,
                                              width: 130,
                                              margin: EdgeInsets.only(
                                                left: 90,
                                              ),
                                              child: Material(
                                                elevation: 5,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFF346EDF),
                                                        Color(0xFF6CC3F9),
                                                      ],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: MaterialButton(
                                                    onPressed: () async =>
                                                        await _performRegister,
                                                    child: Text(
                                                      'SIGN UP',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<void> _register() async {
    ApiResponse response = await ApiController().Register(user: user);
    print(response.message);
    if (response.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  User get user {
    User user = User();
    user.name = _nameTextController.text;
    user.email = _emailTextController.text;
    user.password = _passwordTextController.text;
    user.phone = _phoneTextController.text;
    return user;
  }
}
