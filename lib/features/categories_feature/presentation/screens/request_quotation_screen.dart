import 'package:esm/app/utils/helper.dart';
import 'package:esm/app/widgets/custom_alert_dialog.dart';
import 'package:esm/app/widgets/custom_drop_down.dart';
import 'package:esm/app/widgets/custom_drop_down_widget.dart';
import 'package:esm/features/categories_feature/presentation/screens/user_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class RequestQuotationScreen extends StatefulWidget {
  const RequestQuotationScreen({super.key,});
  @override
  State<RequestQuotationScreen> createState() => _RequestQuotationScreenState();
}

class _RequestQuotationScreenState extends State<RequestQuotationScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController vendorController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> categories=["STEEL" ,"CEMENT","PLASTICS","OTHERS" ];
  List<String> subcategories=["CARBON STEEL" ,"ALLOY STEEL","STAINLESS STEEL", ];
  List<String>products=["LOW CARBON" ,"MEDIUM CARBON","HIGH CARBON", ];
  List<String>vendors=["EZZ STEEL" ,"SUEZ STEEL","EGYPTIAN STEEL", ];
  String? selectedCategory ;
  String? selectedSubCategory ;
  String ?selectedProducts ;
  String ?selectedVendors ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                title: "Request Quotation",
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                physics:const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        controller: categoryController,
                        keyboardType: TextInputType.none,
                        header: "Category",
                        hint: "Select Category",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIconColor: Colors.white,
                        prefixIcon: Icons.person_outline_outlined,
                        suffixIconWidget: CustomDropDownWidget(
                          list: categories,
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                              categoryController.text=selectedCategory!;
                            });
                          },
                        ),
                      ),
                      16.verticalSpace,
                      CustomFormField(
                        controller: subCategoryController,
                        keyboardType: TextInputType.none,
                        header: "Sub Category",
                        hint: "Select Sub Category",
                        filled: true,
                        prefixIconColor: Colors.white,
                        fillColor: Colors.white,
                        prefixIcon: Icons.phone_android,
                        suffixIconWidget: CustomDropDownWidget(
                          list: subcategories,
                          onChanged: (value) {
                            setState(() {
                              selectedSubCategory = value;
                              subCategoryController.text=selectedSubCategory!;
                            });
                          },
                        ),
                      ),
                      16.verticalSpace,
                      CustomFormField(
                        controller: productController,
                        keyboardType: TextInputType.none,
                        header: "Product",
                        hint: "Select Product",
                        filled: true,
                        prefixIconColor: Colors.white,
                        fillColor: Colors.white,
                        prefixIcon: Icons.email_outlined,
                        suffixIconWidget: CustomDropDownWidget(
                          list: products,
                          onChanged: (value) {
                            setState(() {
                              selectedProducts = value;
                              productController.text=selectedProducts!;
                            });
                          },
                        ),
                      ),
                      16.verticalSpace,
                      CustomFormField(
                        controller: vendorController,
                        keyboardType: TextInputType.none,
                        header: "Vendor",
                        hint: "Select Vendor",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icons.email_outlined,
                        prefixIconColor: Colors.white,
                        suffixIconWidget: CustomDropDownWidget(
                          list: vendors,
                          onChanged: (value) {
                            setState(() {
                              selectedVendors = value;
                              vendorController.text=selectedVendors!;
                            });
                          },
                        ),
                      ),
                      16.verticalSpace,
                      CustomFormField(
                        controller: quantityController,
                        header: "Quantity",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icons.email_outlined,
                        prefixIconColor: Colors.white,
                        keyboardType: TextInputType.number,
                        hint: "Enter Quantity",
                      ),
                      27.verticalSpace,
                      TextWidget(
                          title: "Pricing",
                        titleSize: 14.sp,
                        titleFontWeight: FontWeight.w500,
                        titleColor: AppColors.black3333,
                      ),
                      12.verticalSpace,
                      TextWidget(
                          title: "1,000 EGP / 100 KG",
                        titleSize: 14.sp,
                        titleFontWeight: FontWeight.w600,
                        titleColor: AppColors.darkGreen,
                      ),
                      27.verticalSpace,
                      CustomFormField(
                        controller: commentController,
                        header: "Comments",
                        filled: true,
                        maxLines: 8,
                        minLines: 8,
                        fillColor: Colors.white,
                        prefixIcon: Icons.email_outlined,
                        prefixIconColor: Colors.white,
                        hint: "Any additional feedback",
                      ),
                      70.verticalSpace,
                      ButtonWidget(
                        text:"Send Quotation Now",
                        border: Border.all(
                          color: selectedVendors==null?
                          AppColors.mainColor.withOpacity( 0.10000000149011612)
                              :AppColors.mainColor,
                        ),
                        outlined: false,
                        color: selectedVendors==null?
                        AppColors.mainColor.withOpacity( 0.10000000149011612)
                            :AppColors.mainColor,
                        onPressed:selectedVendors==null? (){}: () {
                          globalAlertDialogue(
                            "Price list added successfully",
                            buttonText: "Back To Home",
                            onOk: () {
                              Navigator.of(context).pop();
                              navigateTo(const  UserCategoriesScreen(),removeAll: true);
                            },
                          );

                          // if(formKey.currentState!.validate()){
                          //
                          //
                          // }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
