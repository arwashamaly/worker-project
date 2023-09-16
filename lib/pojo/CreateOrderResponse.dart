import 'package:arwa_worker_flutter_project/pojo/Order.dart';

class CreateOrderResponse {
  int? code;
  bool? success;
  String? message;
  Order? data;

  CreateOrderResponse({this.code, this.success, this.message, this.data});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    if (json['data'] is Map<String, dynamic>) {
      data = json['data'] != null ? Order.fromJson(json['data']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
