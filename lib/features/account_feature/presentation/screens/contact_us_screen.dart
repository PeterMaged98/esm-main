
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      body: Column(
        children: [
          Container(
            height: 140.h,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.h,),
            child:const DefaultAppBarWidget(
              canBack: true,
              title: "Contact Us",
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only
                        (right: 16.w,left:16.w,top: 40.h),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: nameController,
                              header: "Full Name",
                              filled: true,
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
                              hint: "Enter your mobile number",
                            ),
                            16.verticalSpace,
                            CustomFormField(
                              controller: emailController,
                              header: "Email",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icons.email_outlined,
                              hint: "Enter your Email",
                            ),
                            16.verticalSpace,
                            CustomFormField(
                              controller: messageController,
                              header: "Message",
                              filled: true,
                              maxLines:6,
                              minLines: 6,
                              fillColor: Colors.white,
                              prefixIcon: Icons.email_outlined,
                              prefixIconColor: Colors.white,
                              hint: "Enter message here",
                            ),
                          ],
                        ),
                      ),
                    ),
                   70.verticalSpace,
                    Container(
                      padding: EdgeInsetsDirectional.all(20.sp),
                      color: Colors.white,
                      child: ButtonWidget(
                        text: "Send",
                        onPressed: () {
                         if(formKey.currentState!.validate()){

                         }
                        },
                      ),
                    ),
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
