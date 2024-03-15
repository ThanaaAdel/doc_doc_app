import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../widgets/doc_logo_and_name.dart';
import '../widgets/doctor_name_and_logo.dart';
import '../widgets/get_started_button.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 30.h,bottom: 30.h),
        child:  Column(children: [
          const DocLogoAndName(),
          SizedBox(height: 10.h,),
          const DoctorIamgeAndLogo(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: [
              Text(
                'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',style: TextStyles.font14Gray,textAlign: TextAlign.center,),
              SizedBox(height: 20.h,),
              const GetStartedButton(),

            ],),
          )
        ]),),
      ),
    ),);
  }
}
