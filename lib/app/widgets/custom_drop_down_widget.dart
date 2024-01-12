import 'package:esm/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({super.key,  required this.list, required this.onChanged});

 final List<String> list;
 final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: AppColors.white,
          icon:  Icon(
            Icons.keyboard_arrow_down,
            size: 20.sp,
            color: AppColors.black3333,
          ),
        underline: Container(
          color: Colors.white,
        ),
        items: list.map((element){
          return DropdownMenuItem(
            value: element,
            child: TextWidget(
              title: element,
              titleSize: 20.sp,
              titleColor: AppColors.black3333,
            ),
          );
        }).toList(),
        onChanged:onChanged
      ),
    );
  }
}
