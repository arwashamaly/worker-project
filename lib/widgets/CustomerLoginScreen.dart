import 'package:arwa_worker_flutter_project/controller/ApiController.dart';
import 'package:arwa_worker_flutter_project/pojo/ApiResponse.dart';
import 'package:arwa_worker_flutter_project/widgets/CustomerRegisterScreen.dart';
import 'package:arwa_worker_flutter_project/widgets/HomeScreen.dart';
import 'package:flutter/material.dart';

class CustomerLoginScreen extends StatefulWidget {
  CustomerLoginScreen({Key? key}) : super(key: key);

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  bool flag = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
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
            SizedBox(height: 40),
            Container(
              child: Center(child: Image.asset("images/logo.png")),
            ),
            SizedBox(
              height: 38,
            ),
            SizedBox(
              height: 422,
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
                                          controller: _emailController,
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
                                          controller: _passController,
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
                                            Text("Remember me"),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50),
                                              child: Text("Forgot Password?"),
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
                                                Text("New Member?",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomerRegisterScreen()));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Text(
                                                      "SIGN UP",
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
                                                    onPressed:() async => await _performLogin(),
                                                    child: Text(
                                                      'LOGIN',
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 100),
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Get Start Now"),
                                                  Icon(Icons
                                                      .arrow_forward_outlined),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
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

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passController.text.isNotEmpty &&
        _passController.text.length >= 5 &&
        _passController.text.length <= 30) {
      return true;
    }
    return false;
  }

  //mushtaha98@gmail.com
  Future<void> _login() async {
    ApiResponse loginResponse = await ApiController()
        .login(email: _emailController.text, password: _passController.text);
    if (loginResponse.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
