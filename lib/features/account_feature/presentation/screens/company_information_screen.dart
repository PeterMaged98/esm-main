import 'package:esm/app/utils/app_assets.dart';
import 'package:esm/app/utils/app_colors.dart';
import 'package:esm/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class CompanyInformationScreen extends StatefulWidget {
  const CompanyInformationScreen({super.key});

  @override
  State<CompanyInformationScreen> createState() => _CompanyInformationScreenState();
}

class _CompanyInformationScreenState extends State<CompanyInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 140.h,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20.h,),
              child:const DefaultAppBarWidget(
                canBack: true,
                title: "Company Information",
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
                          (right: 16.w,left:16.w,),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Align(
                               child: ImageWidget(
                                    imageUrl: AppImages.ezzSteel,
                                ),
                             ),
                              12.verticalSpace,
                              Align(
                                child: TextWidget(
                                  title: "Ezz Steel",
                                  titleSize:20.sp ,
                                  titleColor: AppColors.black3333,
                                  titleFontWeight: FontWeight.w600,
                                ),
                              ),
                              24.verticalSpace,
                              TextWidget(
                                title: "Company Name",
                                titleSize:14.sp ,
                                titleColor: AppColors.black3333,
                                titleFontWeight: FontWeight.w500,
                              ),
                              19.verticalSpace,
                              Row(
                                children: [
                                 const ImageWidget(
                                    imageUrl: AppAssets.companyField,
                                  ),
                                  5.horizontalSpace,
                                  TextWidget(
                                    title: "Suez Steel",
                                    titleSize:16.sp ,
                                    titleColor: AppColors.black3333,
                                    titleFontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              37.verticalSpace,
                              TextWidget(
                                title: "Uploaded documents (LLC,...)",
                                titleSize:14.sp ,
                                titleColor: AppColors.black3333,
                                titleFontWeight: FontWeight.w500,
                              ),
                              26.verticalSpace,
                              const ImageWidget(
                                  imageUrl:AppImages.doc ,
                              ),
                              22.verticalSpace,
                              TextWidget(
                                title: "Commodity",
                                titleSize:14.sp ,
                                titleColor: AppColors.black3333,
                                titleFontWeight: FontWeight.w500,
                              ),
                              16.verticalSpace,
                              TextWidget(
                                title: "Steel",
                                titleSize:16.sp ,
                                titleColor: AppColors.gery455,
                                titleFontWeight: FontWeight.w700,
                              ),
                              28.verticalSpace,
                              CustomFormField(
                                controller: nameController,
                                header: "Company Address",
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icons.person_outline_outlined,
                                prefixIconColor: Colors.white,
                                suffixIcon: Icons.location_on_outlined,
                                minLines: 3,
                                maxLines: 3,
                                hint: "Ezz Steel, 1089 Nile Corniche, Qasr El Nil, Cairo Governorate 11451",
                              ),
                              18.verticalSpace,
                              CustomFormField(
                                controller: phoneController,
                                header: "Contact Information",
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icons.phone_android,
                                hint: "+201016738840",
                              ),
                              18.verticalSpace,
                              CustomFormField(
                                controller: emailController,
                                header: "Email",
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icons.email_outlined,
                                hint: "mohamed@gmail.com",
                              ),
                            ],
                          ),
                        ),
                      ),
                      70.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.all(20.sp),
              color: Colors.white,
              child: ButtonWidget(
                text: "Save",
                onPressed: () {
                  if(formKey.currentState!.validate()){

                  }
                },
              ),
            ),
          ],
        )
    );
  }
}
