import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 191.w,
      height: 277.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:  Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:const ImageWidget(
                  imageUrl: AppImages.steel,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          15.verticalSpace,
          TextWidget(
            title: "Low Carbon/Mild\n 0.05-0.25%",
            titleSize: 14.sp,
            titleAlign: TextAlign.start,
            titleColor: AppColors.gery455,
            titleFontWeight: FontWeight.w600,
          ),
          8.verticalSpace,
          TextWidget(
            title: "(9  Vendors)",
            titleSize: 13.sp,
            titleAlign: TextAlign.start,
            titleColor: AppColors.mainColor,
            titleFontWeight: FontWeight.w400,
          ),
          8.verticalSpace,
          TextWidget(
            title: "10.000 EGP",
            titleSize: 14.sp,
            titleAlign: TextAlign.start,
            titleColor: AppColors.darkGreen,
            titleFontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
