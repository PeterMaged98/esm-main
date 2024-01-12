import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  final Color? tralingColor;
  final Color? textColor;
  final Color? iconColor;
  final bool arrowIcon;

  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.icon,
    this.tralingColor,
    this.arrowIcon = true, required this.title, this.textColor, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 24.sp,
          color:iconColor?? AppColors.mainColor,
        ),
        minLeadingWidth: 8.w,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0,),
        title: TextWidget(
          title: title,
          titleSize: 16.sp,
          titleFontWeight: FontWeight.w600,
          titleColor:textColor?? AppColors.gery455,
          titleAlign: TextAlign.start,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color:tralingColor?? AppColors.gery455,
          size: 20.sp,
        ),

      ),
    );
  }
}
