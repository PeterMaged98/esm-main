import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/helper.dart';

class CustomDropDown extends StatefulWidget {
  final double? width;
  final double? height;
  final String? headLine;
  final String dropDownHint;
  final TextStyle? dropDownHintTextStyle;
  String? selectedValue;
  final List<String> items;
  final Function(String value) onItemChanged;
  CustomDropDown({Key? key,this.width,this.height,this.selectedValue,this.headLine="",
    required this.dropDownHint,
    this.dropDownHintTextStyle,
    this.items=const [''],required  this.onItemChanged}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //selectedValue=widget.items.first;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width??double.infinity,
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0.h),
      decoration: BoxDecoration(
        // border: Border.all(width: 1.5,color: AppColors.grey9CABBC),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.headLine??"",
                style:  TextStyle(
                  fontSize:14.sp,
                  color: AppColors.gery455,
                  fontFamily: fontRegular,
                  // fontFamily: "DIN-DEMI",
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.dropDownHint,
                        style: widget.dropDownHintTextStyle ?? TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.gery455,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: widget.items.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      item,
                      style: widget.dropDownHintTextStyle ?? TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.gery455,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )).toList(),
                value: widget.selectedValue,
                onChanged: (value) {
                  setState(() {
                    widget.selectedValue = value as String;
                  });
                  widget.onItemChanged(value as String);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.black,
                ),
                iconSize: 24,
                elevation: 0,
                style: const TextStyle(color: AppColors.grey9A9A9A),
                underline: Container(),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
