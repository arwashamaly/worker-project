import 'dart:io';

import 'package:arwa_worker_flutter_project/widgets/OrderDoneScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/ApiController.dart';
import '../pojo/CreateOrderResponse.dart';
import '../pojo/Order.dart';

class CreateOrderScreen extends StatefulWidget {
  int id;

  CreateOrderScreen(this.id);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? file;

  late List<String> photos = [];
  late TextEditingController _controllerProblem;

  late TextEditingController _controllerLocation;

  late TextEditingController _controllerPhone;

  @override
  void initState() {
    super.initState();
    _controllerLocation = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerProblem = TextEditingController();
  }

  @override
  void dispose() {
    _controllerPhone.dispose();
    _controllerProblem.dispose();
    _controllerLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("images/img_9.png"),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                  left: 17,
                  top: 20,
                ),
                Positioned(
                  child: Text(
                    "Smith",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  top: 20,
                  right: 170,
                )
              ],
            ),
            SizedBox(
              height: 31,
            ),
            InkWell(
                onTap: () async {
                  file = await picker.pickImage(source: ImageSource.gallery);
                  photos = [file!.path];
                  setState(() {});
                },
                child: file == null
                    ? Image.asset("images/add_imge.png")
                    : Image.file(
                        File(file!.path),
                        height: 150,
                        width: 150,
                      )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("image must be no more than 2 MB Max 5 Image",
                      style: TextStyle(fontSize: 11, color: Colors.grey))),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controllerProblem,
                maxLines: 4,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF346EDF)),
                  ),
                  hintText: 'More Details About Problem …...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controllerLocation,
                maxLines: 4,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF346EDF)),
                  ),
                  hintText: 'More Details About Location …...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _controllerPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF346EDF)),
                  ),
                  hintText: 'Phone',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, bottom: 50, top: 115),
                child: ElevatedButton(
                  onPressed:() async {
                    _performCreateOrder;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => OrderDoneScreen())
                    );
                  },
                  child: Text("ADD ORDER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    fixedSize: Size(350, 55),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> _performCreateOrder() async {
    if (_checkData() && photos.isNotEmpty) {
      await _createOrder();
    }
  }

  bool _checkData() {
    if (widget.id != null &&
        _controllerProblem.text.isNotEmpty &&
        _controllerLocation.text.isNotEmpty &&
        _controllerPhone.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _createOrder() async {
    if (_checkData()) {
      Order order = getOrders();
      CreateOrderResponse response =
          await ApiController().createOrder(order: order);
      if (response.success!) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OrderDoneScreen()));}
    }
  }

  Order getOrders() {
    Order order = Order();
    order.workId = widget.id;
    order.details = _controllerProblem.text;
    order.detailsAddress = _controllerLocation.text;
    order.phone = _controllerPhone.text;
    order.lat = "22.00";
    order.long = "24.000";
    order.photoOrder = photos;
    return order;
  }
}
