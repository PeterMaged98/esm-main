import 'package:esm/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
Future<bool?> showToast({
  required String msg,
   Color? backgroundColor,
   Color? textColor,
}){
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:backgroundColor??AppColors.mainColor,
      textColor: textColor??Colors.white,
      fontSize: 20.sp
  );
}