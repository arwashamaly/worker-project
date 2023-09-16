import 'dart:convert';
import 'dart:io';

import 'package:arwa_worker_flutter_project/controller/ApiSetting.dart';
import 'package:arwa_worker_flutter_project/pojo/ApiResponse.dart';
import 'package:arwa_worker_flutter_project/pojo/User.dart';
import 'package:arwa_worker_flutter_project/pojo/Work.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../pojo/CreateOrderResponse.dart';
import '../pojo/Order.dart';


class ApiController {
  Future<ApiResponse> login({email, password}) async {
    Uri url = Uri.parse(ApiSetting.login);
    var map = {"email": email, "password": password};

    http.Response response = await http.post(url, body: map);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse loginResponse = ApiResponse.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        if (loginResponse.data != null) {
          GetStorage().write("token", loginResponse.data!.token);
        }
      }
      return loginResponse;
    }
    return ApiResponse(success: false, message: "someThing Wrong");
  }

  Future<ApiResponse> Register({required User user}) async {
    Uri url = Uri.parse(ApiSetting.register);

    http.Response response = await http.post(url, body: user.toJsonReg());
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiResponse registerResponse = ApiResponse.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        if (registerResponse.data != null) {
          GetStorage().write("token", registerResponse.data!.token);
        }
      }
      return registerResponse;
    }
    return ApiResponse(success: false, message: "someThing Wrong");

  }

  Future<List<Work>> getAllWorks() async {
    List<Work> list = [];
    //url
    Uri uri = Uri.parse(ApiSetting.allWorks);
    //method
    http.Response response = await http.get(uri);

    //response
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body['data'].forEach((e) {
        list.add(Work.fromJson(e));
      });
    }
    return list;
  }

  Future<CreateOrderResponse> createOrder({required Order order}) async {
    final url = Uri.parse(ApiSetting.createOrder);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read("token")}',
    };
    final body = jsonEncode(order.toJson());
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody.toString());
      return CreateOrderResponse.fromJson(responseBody);
    } else {
      throw Exception('Failed to add order. Status code: ${response.statusCode}');
    }
  }

}
