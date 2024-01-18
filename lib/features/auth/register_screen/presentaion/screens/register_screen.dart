import 'package:doc_doc_app/features/auth/register_screen/data/model/register_request_body.dart';
import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_cubit.dart';
import 'package:doc_doc_app/features/auth/register_screen/presentaion/widgets/register_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../login_screen/presentaion/widgets/term_and_condition_text.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/register_bloc_listener.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                "Register Page",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(10),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpacing(35),
              Column(
                children: [
                  const RegisterFields(),
                  verticalSpacing(50),
                  AppTextButton(
                      textStyle: TextStyles.font16WithSemiBold,
                      onPressed: () {
                         validateThenDoRegister(context);
                      },
                      textButton: 'Register'),
                  verticalSpacing(20),
                  const TermAndConditionText(),
                  verticalSpacing(70),
                  const AlreadyHaveAccountText(),
                   const RegisterBlocListener(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates(RegisterRequestBody(
        gender: context.read<RegisterCubit>().genderController.text,
          name: context.read<RegisterCubit>().nameController.text,
          email: context.read<RegisterCubit>().emailController.text,
          phone: context.read<RegisterCubit>().phoneController.text,
          password: context.read<RegisterCubit>().passwordController.text,
          passwordConfirmation: context.read<RegisterCubit>().confirmPasswordController.text));
    }
  }
}
