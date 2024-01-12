import 'package:esm/app/widgets/image_widget.dart';
import 'package:esm/app/widgets/text_widget.dart';
import 'package:esm/features/auth_feature/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_drop_down_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../account_feature/presentation/screens/terms_and_conditions_screen.dart';
import '../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/auth_states.dart';
class CompanyRegisterBody extends StatefulWidget {
  const CompanyRegisterBody({super.key,});
  @override
  State<CompanyRegisterBody> createState() => _CompanyRegisterBodyState();
}

TextEditingController nameController = TextEditingController();
TextEditingController companyNameController = TextEditingController();
TextEditingController commodityNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
List<String> categories=["STEEL" ,"CEMENT","PLASTICS","OTHERS" ];
String ? categoryName;
bool value=true;
class _CompanyRegisterBodyState extends State<CompanyRegisterBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.getObject(context: context);
          return  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  21.verticalSpace,
                  Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 92.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width:3.w,color: AppColors.mainColor),
                        ),
                        child:const  ImageWidget(
                          imageUrl: AppAssets.companyField,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Positioned(
                        right: -5.w,
                        bottom: -5.h,
                        child: Container(
                          width: 44.w,
                          height: 44.h,
                          decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Color(0xFF455A64)
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 24.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  21.verticalSpace,
                  CustomFormField(
                    header: "Company Name",
                    hint: "Enter your Company name",
                    controller:  companyNameController,
                    prefixIconWidget:const ImageWidget(
                      imageUrl: AppAssets.companyField,
                    ) ,
                  ),
                  22.verticalSpace,
                  CustomFormField(
                    header: "Upload Company documents (LLC,...)",
                    hint: "Upload Files",
                    enabled: false,
                    prefixIcon: Icons.add,
                    prefixIconColor: Colors.white,
                    suffixIcon: Icons.file_upload_outlined,
                    onPressed: () {},
                  ),
                  22.verticalSpace,
                  CustomFormField(
                    header: "Commodity",
                    hint: "Select Commodity",
                    keyboardType: TextInputType.none,
                    controller: commodityNameController,
                    prefixIcon: Icons.add,
                    prefixIconColor: Colors.white,
                    suffixIconWidget:  CustomDropDownWidget(
                      list: categories,
                      onChanged: (value) {
                        setState(() {
                          categoryName = value;
                          commodityNameController.text=categoryName!;
                        });
                      },
                    ),
                  ),
                  22.verticalSpace,
                  CustomFormField(
                    header: "Full Name",
                    hint: "Enter your full name",
                    controller: nameController,
                    prefixIcon: Icons.person,
                    prefixIconColor: Colors.white,
                  ),
                  22.verticalSpace,
                  CustomFormField(
                    header: "Mobile Number",
                    hint: "Enter your mobile number",
                    controller: phoneController,
                    prefixIcon: Icons.phone_android_sharp,
                  ),
                  22.verticalSpace,
                  CustomFormField(
                    header: "Email",
                    hint: "Enter your Email",
                    controller: emailController,
                    prefixIcon: Icons.email_outlined,
                  ),
                  22.verticalSpace,
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
                  28.verticalSpace,
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
                  48.verticalSpace,
                  ButtonWidget(
                    text: "Sign Up",
                    onPressed: () {
                      showToast(msg: "Sign up Successfully", backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value){
                        navigateTo(const OtpScreen(fromCompanyRegister: true,));
                      });
                      // if (formKey.currentState!.validate()) {
                      //   print("From Register Screen");
                      //   showToast(msg: "Sign up Successfully", backgroundColor: AppColors.mainColor, textColor: Colors.white).then((value){
                      //     navigateTo(const OtpScreen(fromCompanyRegister: true,));
                      //   });
                      // }
                    },
                  ),
                  24.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: CustomTextButton(
                      titleSize: 22.sp,
                      titleFontWeight: FontWeight.bold,
                      onPressed: () {

                      },
                    ),
                  ),
                  100.verticalSpace,

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}