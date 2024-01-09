import 'package:doc_doc_app/core/shared_widgets/app_elevated_button.dart';
import 'package:doc_doc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../core/theming/spacing.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/term_and_condition_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    bool isObscureText = true;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(10),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpacing(35),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(hintText: "Email"),
                      verticalSpacing(25),
                      AppTextFormField(
                          hintText: "Password",
                          obscureText: isObscureText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child:Icon(
                              isObscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),),
                      verticalSpacing(25),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Forget Password",
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpacing(50),
                      AppTextButton(
                          textStyle: TextStyles.font16WithSemiBold,
                          onPressed: () {},
                          textButton: 'Login'),
                      verticalSpacing(20),
                      const TermAndConditionText(),
                      verticalSpacing(70),
                      const AlreadyHaveAccountText(),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
