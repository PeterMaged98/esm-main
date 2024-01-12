import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/widgets/button_widget.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:esm/features/categories_feature/presentation/screens/request_quotation_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/vendor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class VendorDetailsScreen extends StatelessWidget {
  final bool canRequestQuotation;
  const VendorDetailsScreen({this.canRequestQuotation=true,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 143.h,
              color: AppColors.white,
              padding: EdgeInsets.only(top: 30.h,),
              child:const  DefaultAppBarWidget(
                canBack: true,
                actions:false,
                isClosed: false,
                title: "Vendor Details",
              ),
            ),
            31.verticalSpace,
             Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child:const ImageWidget(
                  imageUrl: AppImages.ezzSteelDetails,
                ),
              ),
            ),
            17.verticalSpace,
            Align(
              child: TextWidget(
                title: "Ezz Steel",
                titleSize:20.sp ,
                titleColor: AppColors.black3333,
                titleFontWeight: FontWeight.w600,
              ),
            ),
            25.verticalSpace,
            Container(
              height: 253.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.hint),
                  color: AppColors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title:"Product\n Name",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleAlign: TextAlign.start,
                            titleFontWeight: FontWeight.w700,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Price",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleFontWeight: FontWeight.w700,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Remarks",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleFontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      31.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title:"Medium Carbon 0.26-0.60%",
                            titleColor: AppColors.black3333,
                            titleSize: 16.sp,
                            titleFontWeight: FontWeight.w400,
                          ),
                          31.verticalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                title:"980 EGP",
                                titleColor: AppColors.darkGreen,
                                titleSize: 14.sp,
                                titleFontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    title:"29/11/2023 ",
                                    titleColor: AppColors.darkBlue,
                                    titleSize: 12.sp,
                                    titleFontWeight: FontWeight.w400,
                                  ),
                                  TextWidget(
                                    title:"(last updated price date)",
                                    titleColor: AppColors.field,
                                    titleSize: 12.sp,
                                    titleFontWeight: FontWeight.w400,
                                  ),
                                ],
                              )
                            ],
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Floor Molding",
                            titleColor: AppColors.black3333,
                            titleSize: 13.sp,
                            titleFontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            28.verticalSpace,
            Container(
              height: 183.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.hint),
                color: AppColors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title:"Sales Rep.",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleAlign: TextAlign.start,
                            titleFontWeight: FontWeight.w700,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Phone NO.",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleFontWeight: FontWeight.w700,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Email",
                            titleColor: AppColors.black3333,
                            titleSize: 14.sp,
                            titleFontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      31.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title:"Ahmed Samy",
                            titleColor: AppColors.black3333,
                            titleSize: 16.sp,
                            titleFontWeight: FontWeight.w400,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"+201099987772",
                            titleColor: AppColors.black3333,
                            titleSize: 16.sp,
                            titleFontWeight: FontWeight.w400,
                          ),
                          31.verticalSpace,
                          TextWidget(
                            title:"Sales@Ezzsteel.Com",
                            titleColor: AppColors.black3333,
                            titleSize: 16.sp,
                            titleFontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            50.verticalSpace,
            canRequestQuotation? Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: ButtonWidget(
                onPressed: () {
                   navigateTo(const RequestQuotationScreen());
                },
                text: "Request Quotation",
              ),
            ):0.verticalSpace,
          ],
        ),
      ),
    );
  }
}
