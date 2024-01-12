
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/user_categories_screen.dart';
import 'package:esm/features/price_feature/presentation/screens/under_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/otp_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import 'new_pass_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, this.fromUserRegister = false, this.fromCompanyRegister = false});
  final bool fromUserRegister;
  final bool fromCompanyRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(title: "",),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ImageWidget(
                  imageUrl: AppAssets.otp,
                width: 245.w,
                height: 245.w,
              ),
              24.verticalSpace,
              TextWidget(
                title:"Verification Code",
                titleFontWeight: FontWeight.w600,
                titleSize: 24.sp,
                titleColor: AppColors.black3333,
              ),
              12.verticalSpace,
              TextWidget(
                title:"Code is sent to ***567 write the\n verification code down",
                titleFontWeight: FontWeight.w500,
                titleSize: 16.sp,
                titleColor: AppColors.hint,
              ),
              37.verticalSpace,
              OtpWidget(
                onCompleted: (pin){
                  print(pin);
                  //fromRegister ?navigateTo(const UserCategoriesScreen(),removeAll: true):navigateTo(const NewPassScreen());
                  if(fromUserRegister==true){
                    navigateTo(const UserCategoriesScreen(),removeAll: true);
                  }else if(fromCompanyRegister == true){
                    navigateTo(const UnderReviewScreen(),removeAll: true);
                  }else{
                    navigateTo(const NewPassScreen(),);
                  }
                },
              ),
              32.verticalSpace,
              ButtonWidget(
                text: "Verify",
                textSize: 18.sp,
                onPressed: (){
                  if(fromUserRegister==true){
                    navigateTo(const UserCategoriesScreen(),removeAll: true);
                  }else if(fromCompanyRegister == true){
                    navigateTo(const UnderReviewScreen(),removeAll: true);
                  }else{
                    navigateTo(const NewPassScreen(),);
                  }
                },
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title:"Didn't receive code?",
                    titleFontWeight: FontWeight.w500,
                    titleSize: 16.sp,
                    titleColor: AppColors.field,
                  ),
                  CustomTextButton(
                    title: "Resend Code",
                    titleSize: 16.sp,
                    titleFontWeight: FontWeight.w600,
                    onPressed: () {

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
