import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';


class TextWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextAlign? titleAlign;
  final double? titleSize;
  final TextDecoration? textDecoration;
  final int? titleMaxLines;
  final bool underLine;
  final FontWeight? titleFontWeight;
  final TextOverflow? overflow;

  const TextWidget(
      {super.key, required this.title,
      this.titleColor,
      this.titleAlign,
      this.underLine = false, this.titleSize,
      this.titleMaxLines,
      this.titleFontWeight, this.overflow, this.textDecoration,});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: TextStyle(
        decoration: textDecoration??TextDecoration.none,
        color: titleColor ?? AppColors.field,
        // fontFamily: AppFonts.poppins,
        fontSize: titleSize??18.sp,
        fontWeight: titleFontWeight ?? FontWeight.normal,
      ),
      maxLines: titleMaxLines,
      textAlign: titleAlign ?? TextAlign.center,
      overflow:overflow,
    );
  }
}
