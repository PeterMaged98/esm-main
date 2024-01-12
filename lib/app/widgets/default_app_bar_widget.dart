import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_assets.dart';
import '../utils/app_colors.dart';
import 'image_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final bool actions;
  final bool isClosed;
  final bool isCompany;
  final bool centerTitle;
  final Widget? leading;
  final Widget? titleWidget;
  final VoidCallback? onPop;
  final VoidCallback? actionsOnPressed;
  final bool canBack;
  const DefaultAppBarWidget(
      {this.title,
      this.actions = false,
      Key? key,
      this.onPop,
      this.canBack = true, this.leading,  this.isClosed=false,
        this.actionsOnPressed, this.titleWidget,  this.centerTitle=false,
        this.backgroundColor,  this.isCompany=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:backgroundColor?? Colors.white,
      elevation: 0,
      centerTitle:centerTitle ,
      leading: canBack
          ? IconButton(
              onPressed: onPop ??
                  () {
                    Navigator.pop(context);
                  },
              icon: leading?? Icon(
                Icons.arrow_back_ios_new_rounded,
                color:const Color(0xff455A64),
                size: 24.sp,
              ),
            )
          : null,
      title: titleWidget?? Text(
              title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.gery455,

              ),
            ),
      actions: actions
          ? [
             isClosed ?
             isCompany ?
             Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
               child: ClipRRect(
                 borderRadius:  BorderRadius.circular(16),
                 child: ImageWidget(
                   imageUrl:AppImages.ezzProfile,
                   width: 55.w,
                   height: 55.h,
                   fit: BoxFit.fill,
                 ),
               ),
             ):
             Container(
               width: 48.w,
               height: 48.h,
               margin: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 14.w),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.r),
                 color: AppColors.white
               ),
               child: IconButton(
                 onPressed:actionsOnPressed?? (){},
                 icon: ImageWidget(
                   imageUrl:AppAssets.profile,
                   width: 30.w,
                   height: 30.h,
                 )
               ),
             ):IconButton(
               onPressed:actionsOnPressed?? (){},
               icon: Icon(
                 Icons.close,
                 color: AppColors.gery455,
                 size: 30.sp,
               ),
             )
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 56);
}
