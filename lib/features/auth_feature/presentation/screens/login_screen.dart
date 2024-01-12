
import 'package:esm/app/utils/helper.dart';
import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/auth_feature/presentation/screens/forget_pass_screen.dart';
import 'package:esm/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/user_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.getObject(context: context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
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
                    TextWidget(
                      title: "Sign In",
                      titleFontWeight: FontWeight.w600,
                      titleSize: 20.sp,
                      titleColor: AppColors.mainColor,
                    ),
                    8.verticalSpace,
                    Container(
                      color: Color(0xffE0E0E0),
                      height: 2.h,
                    ),
                    34.verticalSpace,
                    CustomFormField(
                      header: "Email",
                      hint: "Enter your Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      header: "Password",
                      hint: "Enter your password",
                      controller: passwordController,
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: cubit.passObscure==false?Icons.visibility:Icons.visibility_off,
                      obscure: cubit.passObscure,
                      iconPressed: () {
                        cubit.changeVisible();
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextButton(
                        title: "Forgot Password ?",
                        titleColor: AppColors.gery455,
                        onPressed: () {
                          navigateTo(const ForgetPassScreen());
                        },
                      ),
                    ),
                    32.verticalSpace,
                    ButtonWidget(
                      text: "Sign In",
                      textColor: AppColors.mainColor,
                      color: Colors.white,
                      verticalPadding: 17.sp,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("From Login Screen");
                          showToast(msg: "Login Successfully", backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value){
                            navigateTo(const UserCategoriesScreen(),removeAll: true);
                          });
                        }
                      },
                    ),
                    24.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextButton(
                        titleSize: 22.sp,
                        titleFontWeight: FontWeight.bold,
                        onPressed: () {
                          //navigateTo(const BNBScreen(),replace: true);
                        },
                      ),
                    ),
                    62.verticalSpace,
                    TextWidget(
                      title: "Don’t have an Account?",
                      titleFontWeight: FontWeight.w600,
                      titleSize: 16.sp,
                      titleColor: AppColors.gery455,
                    ),
                    12.verticalSpace,
                    ButtonWidget(
                      text: "Register",
                      onPressed: () {
                        navigateTo(const RegisterScreen(),);
                      },
                    ),


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
