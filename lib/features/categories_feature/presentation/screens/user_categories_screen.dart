import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../widget/custom_categories_item.dart';

class UserCategoriesScreen extends StatelessWidget {
  const UserCategoriesScreen({super.key,  this.fromCompany = false});
 final bool fromCompany;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
         fromCompany ?  SizedBox(height:90.h ,) : Container(
            height: 143.h,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: 30.h,),
            child:  DefaultAppBarWidget(
              actionsOnPressed: () {
                navigateTo(const AccountScreen());
              },
              canBack: false,
              actions: true,
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
          24.verticalSpace,
          Expanded(
            child: Column(
              children: [
                TextWidget(
                    title: "Categories",
                  titleFontWeight: FontWeight.w700,
                  titleColor: AppColors.black3333,
                  titleSize: 20.sp,
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                      physics:const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio:1
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(const SubCategoriesScreen());
                          },
                          child:const CustomCategoriesItem(),
                        );
                      },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
