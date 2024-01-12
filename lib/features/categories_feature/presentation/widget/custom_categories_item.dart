import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 191.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Expanded(
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:const ImageWidget(
                imageUrl: AppImages.steel,

              ),
            ),
          ),
          5.verticalSpace,
          TextWidget(
            title: "STEEL",
            titleSize: 14.sp,
            titleColor: AppColors.gery455,
            titleFontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
