import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/helper.dart';

class CustomDropDownFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? header;
  final double? width;
  final double? height;
  final bool? obscure;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Widget? prefixIconWidget;
  final Color? labelColor;
  final Function(String)? onChange;
  final Function()? iconPressed;
  final GestureTapCallback? onPressed;
  final Function(String)? onFieldSubmitted;
  final bool? enabled;
  final bool? filled;
  final TextAlign? align;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final Color? color;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusValue;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disableBorder;
  final List<DropdownMenuItem<Object?>>? items;
  final void Function(dynamic value)? onChanged;

  const CustomDropDownFormField({
    super.key,
    this.controller,
    this.hint = "",
    this.width,
    this.height,
    this.obscure = false,
    this.header,
    this.labelText,
    this.suffixIcon,
    this.suffixIconWidget,
    this.enabled = true,
    this.labelColor,
    this.onPressed,
    this.align,
    this.prefixIcon,
    this.prefixIconWidget,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.iconPressed,
    this.color,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.contentPadding,
    this.borderRadius,
    this.borderRadiusValue,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder, this.disableBorder, this.filled, this.fillColor, this.prefixIconColor, this.onFieldSubmitted, this.items, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header == null
            ? const SizedBox()
            : Text(
          header ?? "",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black3333,
              fontSize: 18.sp),
        ),
        SizedBox(
          height: header == null ? 0 : 15.h,
        ),
        InkWell(
          onTap: onPressed,
          child: DropdownButtonFormField(
            items: items,
            onChanged:onChanged ,
            focusNode: focusNode,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size:20.sp ,
            ),
            style: TextStyle(
                height: 1.2.h,
                fontFamily: fontMedium,
                color: AppColors.black3333,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),

            decoration: InputDecoration(
              fillColor: fillColor??Colors.white,
              filled:filled??false ,
              isDense: true,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 21,
                  ),
              errorStyle: TextStyle(
                fontSize: 14.sp,
                height: 2.h,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue ?? 12),
                  borderSide: const BorderSide(
                    color: AppColors.gery4,
                  )
              ),
              enabledBorder: enabledBorder ?? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue ?? 12),
                  borderSide: const BorderSide(
                    color: AppColors.gery4,
                  )
              ),
              disabledBorder:disableBorder?? OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(borderRadiusValue ?? 12),
                  borderSide: const BorderSide(color: AppColors.gery4)
              ),
              errorBorder: errorBorder ?? OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(borderRadiusValue ?? 12),
                  borderSide: const BorderSide(color: AppColors.red)
              ),
              focusedBorder: focusedBorder ?? OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(borderRadiusValue ?? 12),
                  borderSide:
                  const BorderSide(
                    color: AppColors.gery4,
                  )),
              hintText: hint ?? "",
              hintStyle: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.field,
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.field,
                fontFamily: fontRegular,
              ),
              suffixIcon: suffixIconWidget == null
                  ? (suffixIcon == null
                  ? null
                  : InkWell(
                  onTap: iconPressed ?? () {},
                  child: Icon(
                    suffixIcon,
                    size: 23,
                    color: AppColors.field,
                  )))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  suffixIconWidget!,
                ],
              ),
              prefixIcon: prefixIconWidget == null
                  ? (prefixIcon == null
                  ? null
                  : Icon(
                prefixIcon,
                size: 23.sp,
                color:prefixIconColor?? AppColors.field,
              ))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  prefixIconWidget!,
                  SizedBox(
                    width: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
