import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class UnderReviewScreen extends StatelessWidget {
  const UnderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
          Container(
            // height: 143.h,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: 30.h,),
            child:  DefaultAppBarWidget(
              actionsOnPressed: () {
                navigateTo(const AccountScreen());
              },
              canBack: false,
              actions: true,
              isCompany: true,
              backgroundColor: AppColors.mainColor,
              isClosed: true,
              titleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: "Hello Mr.",
                    titleFontWeight: FontWeight.w400,
                    titleSize: 20.sp,
                    titleColor: AppColors.white,
                  ),
                  TextWidget(
                    title: "Mohamed Ahmed",
                    titleFontWeight: FontWeight.bold,
                    titleSize: 22.sp,
                    titleColor: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
          34.verticalSpace,
          TextWidget(
            title: "Under Review",
            titleFontWeight: FontWeight.w700,
            titleColor: AppColors.black3333,
            titleSize: 20.sp,
          ),
          32.verticalSpace,
          InkWell(
            onTap:() {
              navigateTo(const BNBScreen(),removeAll: true);
            },
            child: Container(
              height: 223.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 80.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(0.10000000149011612),
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40.sp,
                      color:AppColors.black ,
                    ),
                  ),
                  19.verticalSpace,
                  TextWidget(
                    title: "Your account is under review, your account will be activated in 48 hours",
                    titleFontWeight: FontWeight.w600,
                    titleColor: AppColors.black3333,
                    titleSize: 14.sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
