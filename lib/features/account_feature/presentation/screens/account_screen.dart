import 'package:esm/features/account_feature/presentation/screens/company_information_screen.dart';
import 'package:esm/features/account_feature/presentation/screens/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import 'contact_us_screen.dart';
import 'language_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140.h,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20.h,),
              child: const DefaultAppBarWidget(
                isClosed: false,
                canBack: true,
                centerTitle: true,
                title: "Account",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 43.h),
              child: Row(
                children: [
                  ImageWidget(
                      imageUrl: AppImages.profile,
                    width: 64.w,
                    height: 64.h,
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          title: "Mohamed Khalid",
                        titleColor: AppColors.gery455,
                        titleSize: 20.sp,
                        titleFontWeight: FontWeight.w600,
                      ),
                      7.verticalSpace,
                      TextWidget(
                          title: "+201016738840",
                        titleColor: AppColors.hint,
                        titleSize: 16.sp,
                      ),
                    ],
                  )

                ],
              ),
            ),
            23.verticalSpace,
            ///////////////////Personal Information//////////////////
            ListTileWidget(
                onTap: (){
                  navigateTo(const PersonalInfoScreen());
                },
                icon: Icons.person_outline_outlined,
                title: "Personal Information",
            ),
            16.verticalSpace,
            ///////////////////Company Info//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const CompanyInformationScreen());
              },
              icon: Icons.info,
              title: "Company Information",
            ),
            16.verticalSpace,
            ///////////////////language//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const LanguageScreen());
              },
              icon: Icons.language,
              title: "Languages",
            ),
            16.verticalSpace,
            ///////////////////Contact us//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const ContactUsScreen());
              },
              icon: Icons.sms,
              title: "Contact us",
            ),
            16.verticalSpace,
            ///////////////////log out//////////////////
            ListTileWidget(
              onTap: (){},
              icon: Icons.logout_rounded,
              iconColor: AppColors.red,
              textColor: AppColors.red,
              tralingColor: Colors.white,
              title: "Log Out",
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
