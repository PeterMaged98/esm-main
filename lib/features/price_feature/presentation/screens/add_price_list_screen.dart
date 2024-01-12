import 'package:esm/app/utils/app_colors.dart';
import 'package:esm/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:esm/features/price_feature/presentation/presentation_logic_holder/price_cubit.dart';
import 'package:esm/features/price_feature/presentation/presentation_logic_holder/price_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class AddPriceListScreen extends StatefulWidget {
  const AddPriceListScreen({super.key});

  @override
  State<AddPriceListScreen> createState() => _AddPriceListScreenState();
}

class _AddPriceListScreenState extends State<AddPriceListScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> categories=["STEEL" ,"CEMENT","PLASTICS","OTHERS" ];
  List<String> subcategories=["CARBON STEEL" ,"ALLOY STEEL","STAINLESS STEEL", ];
  List<String>products=["LOW CARBON" ,"MEDIUM CARBON","HIGH CARBON", ];
  String ?categoryName ;
  String ?subCategoryName ;
  String ?productName ;
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
                      dropDownHint: categoryName??'Category',
                      onItemChanged: (item){
                        categoryName = item;
                        categoryController.text=categoryName!;
                      },
                      items:categories,
                    ),
                    16.verticalSpace,
                    CustomDropDown(
                      headLine: "Sub Category",
                      dropDownHint: subCategoryName??'Select Sub Category',
                      onItemChanged: (item){
                        subCategoryName = item;
                        subCategoryController.text=subCategoryName!;
                      },
                      items:subcategories,
                    ),
                    16.verticalSpace,
                    CustomDropDown(
                      headLine: "Product",
                      dropDownHint: productName??'Select Product"',
                      onItemChanged: (item){
                        productName = item;
                        productController.text=productName!;
                        print(productName);
                      },
                      items:products,
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
                            onChange: (val){
                              setState(() {

                              });
                            },
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
            child: BlocBuilder<PriceCubit, PriceSates>(
             builder: (context, state) {
               var cubit = PriceCubit.getObject(context: context);
                return ButtonWidget(
                  text:"Add Price List",
                  border: Border.all(
                    color: productName==null?
                    AppColors.mainColor.withOpacity( 0.10000000149011612)
                        :AppColors.mainColor,
                  ),
                  outlined: false,
                  color: productName==null?
                  AppColors.mainColor.withOpacity( 0.10000000149011612)
                      :AppColors.mainColor,
                  onPressed:productName==null? (){}: () {
                    cubit.addNewPriceList(
                        category: categoryName!,
                        subCategory: subCategoryName!,
                        product: productName!,
                        price: priceController.text,
                    );
                    globalAlertDialogue(
                      "Price list added successfully",
                      buttonText: "Back To Home",
                      onOk: () {
                        Navigator.of(context).pop();
                        navigateTo(const  BNBScreen(),removeAll: true);
                      },
                    );

                    // if(formKey.currentState!.validate()){
                    //
                    //
                    // }
                  },
                );
      },
            ),
          ),
          33.verticalSpace,
        ],
      ),
    );
  }
}
