import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/app_strings.dart';
import '../../app/utils/get_it_injection.dart';
import '../../app/utils/helper.dart';
import '../../app/utils/navigation_helper.dart';
import '../utils/app_assets.dart';
import 'button_widget.dart';
import 'image_widget.dart';
import 'text_widget.dart';

globalAlertDialogue(String title1,
    {
      String? title2,
      VoidCallback? onCancel,
      VoidCallback? onOk,
      String ?buttonText,
      String ?buttonText2,
      IconData? iconData,
      Color? iconDataColor,
    }) {
  showDialog(
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 298.h,
        width: 396.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          alignment: Alignment.center,
          title: Center(
            child: Container(
              width: 72.w,
              height: 72.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.green2.withOpacity(0.10000000149011612),
                shape: BoxShape.circle
              ),
              child: Icon(
                iconData??Icons.check,
                color: iconDataColor??AppColors.green2,
                size: 30.sp,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: AppColors.blue,
                    fontSize: 20.sp,
                ),
              ),
              title2==null?const SizedBox():Text(
                title2??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.green,
                    fontSize: 18.sp,
                  fontFamily: fontRegular,
                ),
              ),
              const SizedBox(height: 24,),
              ButtonWidget(
                onPressed: onOk ?? () {
                      Navigator.pop(context);

                    },
                child: Center(
                  child: Text(
                    buttonText??AppStrings.ok,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600
                    ),
              ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

globalAlertDialogueWithDuration(BuildContext context, String title1,
    {
      String? title2,
      IconData? iconData,
      int? seconds,
      required VoidCallback onOk,
    }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 336.h,
        width: 348.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          // insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: AppColors.black262626,
          title: Center(
            child: ImageWidget(
                imageUrl: AppAssets.checkMark,
              height: 78.h,
              width: 78.h,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                title: title1,
                titleSize: 24.sp,
                titleAlign: TextAlign.center,
                titleFontWeight: FontWeight.w600,
              ),
              Text(
                title2??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 18.sp,
                  fontFamily: fontRegular,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  Future.delayed(Duration(seconds:seconds??2),(){
   onOk();
  });
}
