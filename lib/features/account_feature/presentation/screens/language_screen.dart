import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
          Container(
            height: 140.h,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.h,),
            child:const  DefaultAppBarWidget(
              canBack: true,
              title: "Language",
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  title: "Arabic",
                  titleColor: AppColors.gery455,
                  titleSize: 19.sp,
                  titleFontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.check_circle_outline,
                  size: 30.sp,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  title: "Arabic",
                  titleColor: AppColors.white,
                  titleSize: 19.sp,
                  titleFontWeight: FontWeight.bold,
                ),
                Icon(
                  Icons.check_circle_outline,
                  size: 30.sp,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
