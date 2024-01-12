import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:esm/features/categories_feature/presentation/screens/vendor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 143.h,
            color: AppColors.white,
            padding: EdgeInsets.only(top: 30.h,),
            child:const  DefaultAppBarWidget(
              canBack: true,
              actions:false,
              isClosed: false,
              title: "Vendors",
            ),
          ),
          21.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left:22.w ),
            child: TextWidget(
              title: "Medium Carbon 0.26-0.60%",
              titleFontWeight: FontWeight.w600,
              titleColor: AppColors.black3333,
              titleSize: 20.sp,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:22.w ),
            child: TextWidget(
              title: "(3 Vendors)",
              titleFontWeight: FontWeight.w600,
              titleColor: AppColors.mainColor,
              titleSize: 14.sp,
            ),
          ),
          37.verticalSpace,
          Padding(
            padding:  EdgeInsets.only(left:22.w ),
            child: TextWidget(
              title: "Select One vendor:",
              titleFontWeight: FontWeight.w700,
              titleColor: AppColors.black3333,
              titleSize: 16.sp,
            ),
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.hint),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex : 2,
                      child: TextWidget(
                          title: "Companies",
                        titleSize: 10.sp,
                        titleFontWeight: FontWeight.w400,
                        titleAlign: TextAlign.start,
                        titleColor: AppColors.black3333,
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                          title: "Prices",
                        titleSize: 10.sp,
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColors.black3333,
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                          title: "Remarks",
                        titleSize: 10.sp,
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColors.black3333,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Container(height: 1,color: AppColors.hint,),
                20.verticalSpace,
                InkWell(
                  onTap:() {
                   navigateTo(const VendorDetailsScreen(canRequestQuotation: false,));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            ImageWidget(
                              imageUrl: AppImages.ezzSteel,
                              width: 46.w,
                              height: 46.h,
                            ),
                            11.horizontalSpace,
                            TextWidget(
                              title: "Ezz Steel",
                              titleFontWeight: FontWeight.w600,
                              titleColor: AppColors.black3333,
                              titleSize: 14.sp,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextWidget(
                              title: "980 Egp",
                              titleFontWeight: FontWeight.w600,
                              titleColor: AppColors.darkGreen,
                              titleSize: 14.sp,
                            ),
                            TextWidget(
                              title: "29/11/2023",
                              titleFontWeight: FontWeight.w400,
                              titleColor: AppColors.darkBlue,
                              titleSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextWidget(
                          title: "floor molding",
                          titleFontWeight: FontWeight.w400,
                          titleColor: AppColors.black3333,
                          titleSize: 13.sp,
                        ),
                      ),

                    ],
                  ),
                ),
                20.verticalSpace,
                Container(height: 1,color: AppColors.hint,),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          ImageWidget(
                            imageUrl: AppImages.ezzSteel,
                            width: 46.w,
                            height: 46.h,
                          ),
                          11.horizontalSpace,
                          TextWidget(
                            title: "Ezz Steel",
                            titleFontWeight: FontWeight.w600,
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextWidget(
                            title: "980 Egp",
                            titleFontWeight: FontWeight.w600,
                            titleColor: AppColors.darkGreen,
                            titleSize: 14.sp,
                          ),
                          TextWidget(
                            title: "29/11/2023",
                            titleFontWeight: FontWeight.w400,
                            titleColor: AppColors.darkBlue,
                            titleSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                        title: "floor molding",
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColors.black3333,
                        titleSize: 13.sp,
                      ),
                    ),

                  ],
                ),
                020.verticalSpace,
                Container(height: 1,color: AppColors.hint,),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          ImageWidget(
                            imageUrl: AppImages.ezzSteel,
                            width: 46.w,
                            height: 46.h,
                          ),
                          11.horizontalSpace,
                          TextWidget(
                            title: "Ezz Steel",
                            titleFontWeight: FontWeight.w600,
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          TextWidget(
                            title: "980 Egp",
                            titleFontWeight: FontWeight.w600,
                            titleColor: AppColors.darkGreen,
                            titleSize: 14.sp,
                          ),
                          TextWidget(
                            title: "29/11/2023",
                            titleFontWeight: FontWeight.w400,
                            titleColor: AppColors.darkBlue,
                            titleSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                        title: "floor molding",
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColors.black3333,
                        titleSize: 13.sp,
                      ),
                    ),

                  ],
                ),
                20.verticalSpace,
              ],
            ),
          )

          // Table(
          //   children: [
          //   TableRow(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       border: Border.all(color: AppColors.hint),
          //     ),
          //     children: [
          //       Row(
          //        children: [

          //        ],
          //       ),
          //       Text("data"),
          //       Text("data"),
          //     ]
          //   )
          // ],
          // )
        ],
      ),
    );
  }
}
