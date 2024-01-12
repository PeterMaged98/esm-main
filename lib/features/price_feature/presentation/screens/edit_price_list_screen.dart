import 'package:esm/app/utils/app_colors.dart';
import 'package:esm/app/widgets/custom_drop_down_widget.dart';
import 'package:esm/features/price_feature/presentation/screens/home_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class EditPriceListScreen extends StatefulWidget {
  const EditPriceListScreen({super.key});

  @override
  State<EditPriceListScreen> createState() => _EditPriceListScreenState();
}

class _EditPriceListScreenState extends State<EditPriceListScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController vendorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> categories=["STEEL" ,"CEMENT","PLASTICS","OTHERS" ];
  List<String> subcategories=["CARBON STEEL" ,"ALLOY STEEL","STAINLESS STEEL", ];
  List<String>products=["LOW CARBON" ,"MEDIUM CARBON","HIGH CARBON", ];
  List<String>vendors=["EZZ STEEL" ,"SUEZ STEEL","EGYPTIAN STEEL", ];
  String ?categoryName ;
  String ?subCategoryName ;
  String ?productName ;
  String ?vendorName ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
          Container(
            height: 130.h,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.h,),
            child: DefaultAppBarWidget(
              canBack: true,
              isClosed: false,
              actions: true,
              actionsOnPressed: () {
                Navigator.pop(context);
              },
              title: "Add Price List ",
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              physics:const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDown(
                      headLine: "Select Category",
                      dropDownHint: 'Category',
                      onItemChanged: (item){},
                      items:categories,
                    ),
                    16.verticalSpace,
                    CustomDropDown(
                      headLine: "Sub Category",
                      dropDownHint: 'Select Sub Category',
                      onItemChanged: (item){},
                      items:subcategories,
                    ),
                    16.verticalSpace,
                    CustomDropDown(
                      headLine: "Product",
                      dropDownHint: 'Select Product"',
                      onItemChanged: (item){},
                      items:products,
                    ),
                    16.verticalSpace,
                    CustomDropDown(
                      headLine: "Vendor",
                      dropDownHint: 'Select Vendor"',
                      onItemChanged: (item){},
                      items:vendors,
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomFormField(
                            controller: priceController,
                            header: "Price",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icons.email_outlined,
                            prefixIconColor: Colors.white,
                            keyboardType: TextInputType.number,
                            hint: "Enter price",
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              TextWidget(
                                title: "Unit",
                                titleFontWeight: FontWeight.w500,
                                titleColor: AppColors.black3333,
                                titleSize: 14.sp,
                              ),
                              25.verticalSpace,
                              TextWidget(
                                title: "/100 KG",
                                titleFontWeight: FontWeight.w600,
                                titleColor: AppColors.darkGreen,
                                titleSize: 14.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    onPressed: () {

                    },
                    text: "Edit",
                  ),
                ),
                44.horizontalSpace,
                Expanded(
                  child: ButtonWidget(
                    outlined: false,
                    onPressed: () {

                    },
                    text: "Delete",
                    color: AppColors.red,
                  ),
                ),
              ],
            )
          ),
          33.verticalSpace,
        ],
      ),
    );
  }
}
