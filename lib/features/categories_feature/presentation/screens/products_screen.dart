import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/vendors_screen.dart';
import 'package:esm/features/categories_feature/presentation/widget/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../widget/custom_categories_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
          Container(
            height: 143.h,
            color: AppColors.white,
            padding: EdgeInsets.only(top: 30.h,),
            child: const DefaultAppBarWidget(
              canBack: true,
              actions:false,
              isClosed: false,
              title: "Products",
            ),
          ),
          Container(
            height: 140.h,
            width: double.infinity,
            alignment: Alignment.center,
            decoration:const BoxDecoration(
                color:Colors.black,
                image: DecorationImage(
                    opacity: .25,
                    image: AssetImage(
                        AppImages.steel
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: TextWidget(
              title: "STEEL > CARBON STEELS",
              titleFontWeight: FontWeight.w700,
              titleColor: AppColors.mainColor,
              titleSize: 20.sp,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 23.h),
              physics:const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio:.75
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                     navigateTo(const VendorsScreen());
                  },
                  child : const CustomProductItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
