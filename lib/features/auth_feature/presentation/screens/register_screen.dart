import 'package:esm/app/widgets/default_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../widget/user_register_body.dart';
import '../widget/company_register_body.dart';

class RegisterScreen extends StatefulWidget {
  final bool fromCheckout;
  const RegisterScreen({super.key, this.fromCheckout = false});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const DefaultAppBarWidget(title: "",),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              112.verticalSpace,
              TextWidget(
                title: "Welcome To",
                titleFontWeight: FontWeight.w600,
                titleSize: 24.sp,
                titleColor: AppColors.black3333,
              ),
              10.verticalSpace,
              ImageWidget(
                imageUrl: AppAssets.appLogo ,
                width: 219.w,
                height: 76.h,
              ),
              6.verticalSpace,
              TextWidget(
                title: "We are happy to see you",
                titleFontWeight: FontWeight.w500,
                titleSize: 16.sp,
                titleColor: AppColors.hint,
              ),
              38.verticalSpace,
              TabBar(
                controller: tabController,
                indicatorColor: AppColors.mainColor,
                unselectedLabelColor: AppColors.field,
                labelColor: AppColors.mainColor,
                labelStyle: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp
                ),
                indicatorWeight: 4,
                labelPadding: EdgeInsets.only(bottom: 12.h),
                tabs:const [
                  Text(
                      "User",
                  ),
                  Text(
                      "Company",
                  ),
                ],
              ),
              20.verticalSpace,
              Expanded(
                child: TabBarView(
                  physics:const BouncingScrollPhysics(),
                  controller: tabController,
                  children: const [
                     UserRegisterBody(),
                     CompanyRegisterBody()
                  ],
                ),
              )

            ],
          ),
        ),
    );
  }
}