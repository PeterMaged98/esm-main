import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/widgets/text_widget.dart';

class CustomColorItem extends StatelessWidget {
  const CustomColorItem({super.key, required this.colorName
    , required this.backgroundColor, required this.textColor});
  final String colorName;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:backgroundColor
          //AppColors.gery455:AppColors.gery455.withOpacity(.05),
        ),
        child: TextWidget(
          title: colorName,
          titleColor: textColor,
          titleSize: 20.sp,
          titleFontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
