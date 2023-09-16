import 'package:arwa_worker_flutter_project/pojo/User.dart';

class ApiResponse {
  int? code;
  bool? success;
  String? message;
  User? data;

  ApiResponse({this.code, this.success, this.message, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
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

