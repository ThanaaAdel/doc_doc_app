import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../data/models/login_request_body.dart';
import '../../logic/login_cubit.dart';
import '../widgets/don`t_have_an_account.dart';
import '../widgets/email_and_password.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/term_and_condition_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

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
              Column(
                children: [
                  const EmailAndPassword(),
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
                      onPressed: () {
                        validateThenDoLogin(context);

                      },
                      textButton: 'Login'),
                  verticalSpacing(20),
                  const TermAndConditionText(),
                  verticalSpacing(70),
                  const DonNotHaveAnAccount(),
                  const LoginBlocListener(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context){
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
      setState(() {
        context.read<LoginCubit>().emailController.clear();
        context.read<LoginCubit>().passwordController.clear();
      });
    }
  }
}
