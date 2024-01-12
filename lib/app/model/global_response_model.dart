import 'dart:convert';

import '../../app/error/exceptions.dart';

class GlobalResponseModel {
  GlobalResponseModel({
      this.success,
      this.data,
    this.authError,
      this.msg,});

  factory GlobalResponseModel.fromJson(String source) {
    try {
      return GlobalResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  GlobalResponseModel.fromMap(Map<String, dynamic> json) {
    //TODO:change the behavior of [key] key
    success = json['key']=="fail"||json['key']=="exception"?false:true;
    authError = json['key']=="unauthenticated";
    data = json['data'];
    msg = json['msg'] ;
    // errors = json['msg'] != null ? json['Errors'].cast<String>() : [];
  }
  bool? success;
  bool? authError;
  dynamic data;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = success;
    map['Data'] = data;
    map['msg'] = msg;
    return map;
  }

}