import 'package:esm/app/model/price_list_model.dart';
import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_widget.dart';
class CustomPriceListItem extends StatelessWidget {
  const CustomPriceListItem({super.key, required this.priceListModel});
 final PriceListModel priceListModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(bottom: 10.h,right: 16.w,left: 16.w),
      //padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white
      ),
      child: ListTile(
        horizontalTitleGap: 20.w,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ImageWidget(
            imageUrl: AppImages.steel,
            width: 77.w,
            height: 107.h,
            fit: BoxFit.cover,
          ),
        ),
        trailing: Padding(
          padding:  EdgeInsets.only(top: 20.h),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20.sp,
            color: AppColors.gery455,
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.only(top: 14.h),
          child: TextWidget(
            title:priceListModel.subCategory,
            titleSize: 14.sp,
            titleAlign: TextAlign.start,
            titleFontWeight: FontWeight.w600,
            titleColor: AppColors.black3333,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            TextWidget(
              title: priceListModel.price,
              titleSize: 14.sp,
              titleAlign: TextAlign.start,
              titleFontWeight: FontWeight.w600,
              titleColor: AppColors.darkGreen,
            ),
            8.verticalSpace,
            TextWidget(
              title: "29/11/2023 - 10:30pm",
              titleSize: 12.sp,
              titleAlign: TextAlign.start,
              titleFontWeight: FontWeight.w400,
              titleColor: AppColors.darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
