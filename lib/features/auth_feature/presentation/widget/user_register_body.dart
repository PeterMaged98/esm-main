import 'package:esm/app/widgets/text_widget.dart';
import 'package:esm/features/account_feature/presentation/screens/terms_and_conditions_screen.dart';
import 'package:esm/features/auth_feature/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/auth_states.dart';
import '../screens/forget_pass_screen.dart';

class UserRegisterBody extends StatefulWidget {
  const UserRegisterBody({super.key,});

  @override
  State<UserRegisterBody> createState() => _UserRegisterBodyState();
}

class _UserRegisterBodyState extends State<UserRegisterBody> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 bool value=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.getObject(context: context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  CustomFormField(
                    header: "Full Name",
                    hint: "Enter your Full Name",
                    controller: nameController,
                    prefixIcon: Icons.person,
                  ),
                  18.verticalSpace,
                  CustomFormField(
                    header: "Mobile Number",
                    hint: "Enter your mobile number",
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone_android_sharp,
                  ),
                 18.verticalSpace,
                  CustomFormField(
                    header: "Email",
                    hint: "Enter your Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icons.email_outlined,
                  ),
                  18.verticalSpace,
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
                  31.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: 32.w,
                        height: 32.h,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          value: value,
                          onChanged:  (newValue) {
                            setState(() {
                              value = newValue!;
                              print(value);
                            });
                          },
                          activeColor: AppColors.gery455,
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextWidget(
                            title: "I Agree on  ",
                            titleSize: 14.sp,
                            titleFontWeight: FontWeight.w400,
                            titleColor: AppColors.black3333,
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(const TermsAndConditionsScreen());
                            },
                            child: TextWidget(
                              title: "Terms & Conditions",
                              titleSize: 15.sp,
                              titleFontWeight: FontWeight.w600,
                              titleColor: AppColors.black3333,
                              textDecoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 27.verticalSpace,
                  ButtonWidget(
                    text: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("From Login Screen");
                        showToast(msg: "Register Successfully", backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value){
                        navigateTo(const OtpScreen(fromUserRegister: true,));
                        });
                      }
                    },
                  ),
                  27.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: CustomTextButton(
                      titleSize: 16.sp,
                      titleFontWeight: FontWeight.w600,
                      onPressed: () {
                        //navigateTo(const BNBScreen(),replace: true);
                      },
                    ),
                  ),
                  100.verticalSpace


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}