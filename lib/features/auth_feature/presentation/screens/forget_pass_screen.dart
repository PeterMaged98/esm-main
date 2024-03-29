
import 'package:esm/app/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import 'otp_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key,});
  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(title: "",),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ImageWidget(
                    imageUrl: AppAssets.forgetPass,
                  height: 285.w,
                  width: 285.h,
                ),
                32.verticalSpace,
                TextWidget(
                    title: "Forgot Password",
                  titleSize: 24.sp,
                  titleFontWeight: FontWeight.w600,
                  titleColor: AppColors.black3333,
                ),
                12.verticalSpace,
                TextWidget(
                    title: "Enter the mobile number associated with \n your account to send the code",
                  titleSize: 16.sp,
                  titleFontWeight: FontWeight.w500,
                  titleColor: AppColors.hint,
                ),
                32.verticalSpace,
                CustomFormField(
                  header: "Mobile Number",
                  hint: "Enter your mobile number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_android_sharp,
                ),
                32.verticalSpace,
                ButtonWidget(
                  onPressed: (){
                    if(formKey.currentState!.validate()&&phoneController.text.length==11){
                      showToast(msg: "We send you a SMS code",).then((value){
                        navigateTo(const OtpScreen());
                      });
                    }else{
                      showToast(msg: "wrong phone Number",backgroundColor: AppColors.red,textColor: AppColors.white);
                    }
                  },
                  text: "Submit",
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        title: "Back",
                      titleSize: 19.sp,
                      titleFontWeight: FontWeight.w500,
                    ),
                    CustomTextButton(
                      title: "Sign In",
                      titleSize: 21.sp,
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppColors.gery455,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
