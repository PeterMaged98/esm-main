import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/ui_helpers.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget({super.key,
    this.borderRadius,this.borderRadiusObject,
    this.textSize = 18,this.text, this.icon,
    this.color , this.border,this.onPressed,
    this.width=double.infinity, this.height ,this.decoration ,
    this.textColor,this.loading =false,this.child ,
    this.horizontalPadding=0,this.verticalPadding=17,
    this.outlined=true, this.align,
  });
  final String? text ;
  final Function()? onPressed ;
  final double? width ;
  final double? height ;
  final double? textSize ;
  final BoxDecoration? decoration;
  final Color? textColor ;
  final bool loading ;
  final Color? color ;
  final Border? border ;
  final TextAlign? align ;
  final Widget? icon ;
  final double? borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final BorderRadius? borderRadiusObject ;
  final Widget? child ;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return loading ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor ,))
        :
    InkWell(
      onTap: (){
        UIHelpers.removeKeyboard();
        if(onPressed!= null ){
          onPressed!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:horizontalPadding ,vertical:verticalPadding ),
        width: width,
        height: height ,
        decoration: decoration ?? BoxDecoration(
            color: color ??AppColors.mainColor ,
            borderRadius:borderRadiusObject ??BorderRadius.circular(borderRadius ?? 12),
            border: outlined?Border.all(color:AppColors.mainColor,):border
        ),
        child:child??Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon??const SizedBox(),
            if (icon!= null && (text?.isNotEmpty??false)) const SizedBox(width: 8,) else Container(),
            Text(
              text??"" ,
              textAlign:align ,
              style: TextStyle(
                color: textColor??AppColors.white ,
                fontSize: textSize??18.sp ,
                fontWeight: FontWeight.w600,
                // fontFamily: AppFontsWeight.regular
              ),
            ),
          ],
        ),
      ),
    );
  }
}