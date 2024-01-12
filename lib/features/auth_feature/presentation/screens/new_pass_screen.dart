
import 'package:esm/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:esm/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/auth_states.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AuthCubit.getObject(context: context);
            return Scaffold(
              appBar:const DefaultAppBarWidget(title: "",),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        ImageWidget(
                            imageUrl: AppAssets.resetPass,
                          width: 284.w,
                          height: 284.h,
                        ),
                        32.verticalSpace,
                        TextWidget(
                          title: "Reset Password",
                          titleSize: 24.sp,
                          titleFontWeight: FontWeight.w600,
                          titleColor: AppColors.black3333,
                        ),
                        SizedBox(height:12.h ,),
                        TextWidget(
                          title: "Your new password Must be at\n least 8 characters. ",
                          titleSize: 16.sp,
                          titleFontWeight: FontWeight.w500,
                          titleColor: AppColors.hint,
                        ),
                        32.verticalSpace,
                        CustomFormField(
                          header: "New Password",
                          hint: "Enter your new password",
                          controller: passwordController,
                          prefixIcon: Icons.lock_outline_sharp,
                          suffixIcon: cubit.passObscure == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscure: cubit.passObscure,
                          iconPressed: () {
                            cubit.changeVisible();
                          },
                        ),
                        16.verticalSpace,
                        CustomFormField(
                          header: "Re-Enter New Password",
                          hint: "Re-Enter New Password",
                          controller: newPasswordController,
                          prefixIcon: Icons.lock_outline_sharp,
                          suffixIcon: cubit.newPassObscure == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscure: cubit.newPassObscure,
                          iconPressed: () {
                            cubit.changeNewPassVisible();
                          },
                        ),
                        32.verticalSpace,
                        ButtonWidget(
                          text: "Reset Password",
                          onPressed: () {
                            if (formKey.currentState!.validate()
                                &&passwordController.text.length >=8&&
                            passwordController.text==newPasswordController.text
                            ) {
                              navigateTo(const LoginScreen(),removeAll: true);
                              print("From New Password Screen");
                            }else{
                              showToast(
                                  msg: "Please,Your new password Must be at least 8 And Two Password must be the same",
                                  backgroundColor: AppColors.red,
                                  textColor: AppColors.white,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
