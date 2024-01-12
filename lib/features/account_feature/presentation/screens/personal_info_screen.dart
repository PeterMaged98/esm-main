import 'package:easy_localization/easy_localization.dart';
import 'package:esm/features/auth_feature/presentation/screens/new_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../widgets/custom_edit_button.dart';
import '../widgets/custom_sheet_profile.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController(text: "Mohamed");
  TextEditingController phoneController = TextEditingController(text: "Mohamed@gmail.com");
  TextEditingController emailController = TextEditingController(text: "+201016738840");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            height: 140.h,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.h,),
            child:const DefaultAppBarWidget(
              canBack: true,
              title: "Personal Information",
            ),
          ),
          15.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 160.w,
                          height: 160.h,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                AppImages.profile,
                              )
                            )
                          ),
                        ),
                        Positioned(
                          right: 10.w,
                          bottom: 10.h,
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Color(0xFF455A64)
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                size: 30.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    40.verticalSpace,
                    CustomFormField(
                      controller: nameController,
                      header: "Full Name",
                      filled: true,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller: nameController);
                        },
                      ),
                      fillColor: Colors.white,
                      prefixIcon: Icons.person_outline_outlined,
                      hint: "Enter your full name",
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      controller: phoneController,
                      header: "Mobile Number",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icons.phone_android,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller: phoneController);
                        },
                      ),
                      hint: "Enter your mobile number",
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      controller: emailController,
                      header: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller: emailController);
                        },
                      ),
                      prefixIcon: Icons.email_outlined,
                      hint: "Enter your Email",
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        CustomTextButton(
                          onPressed: () {
                            navigateTo(const NewPassScreen());
                          },
                          title: "Change Password",
                          titleColor: AppColors.gery455,
                          titleSize: 19.sp,
                          titleFontWeight: FontWeight.w600,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18.sp,
                          color: AppColors.gery455,
                        )
                      ],
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        CustomTextButton(
                          onPressed: () {},
                          title: "Delete Account",
                          titleColor: AppColors.red,
                          titleSize: 19.sp,
                          titleFontWeight: FontWeight.w600,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18.sp,
                          color: AppColors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
