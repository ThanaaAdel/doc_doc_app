import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../login_screen/presentaion/widgets/password_validations.dart';
class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  // late TextEditingController passwordController;
  // @override
  // void initState() {
  //   super.initState();
  //   // passwordController = context.read<LoginCubit>().passwordController;
  //   setupPasswordControllerListener();
  // }
  // void setupPasswordControllerListener(){
  //   passwordController.addListener(() {
  //     setState(() {
  //       hasLowerCase = AppRex.hasLowerCase(passwordController.text);
  //       hasUpperCase = AppRex.hasUpperCase(passwordController.text);
  //       hasNumber = AppRex.hasNumber(passwordController.text);
  //       hasMinLength = AppRex.isMinLength(passwordController.text);
  //       hasSpecialCharacters = AppRex.hasSpecialCharacter(passwordController.text);
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return    Form(
         key: context.read<RegisterCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              textInputType: TextInputType.text,
              hintText: "Name",validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
              controller: context.read<RegisterCubit>().nameController,
            ),
            verticalSpacing(18),
            AppTextFormField(
              textInputType: TextInputType.text,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty || !AppRex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
               controller: context.read<RegisterCubit>().emailController,
            ),
            verticalSpacing(18),
            AppTextFormField(
              textInputType: TextInputType.number,
              controller: context.read<RegisterCubit>().phoneController,hintText: "Phone", validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Phone';
              }
            },),
            verticalSpacing(18),
            AppTextFormField(
              textInputType: TextInputType.number,
              controller: context.read<RegisterCubit>().genderController,hintText: "Gender",
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid gender';
              }
            },),
            AppTextFormField(
              textInputType: TextInputType.visiblePassword,
              hintText: "Password",
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Please enter a valid Password';
                }
              },
               controller:
               context.read<RegisterCubit>().passwordController,
              obscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpacing(18),
            AppTextFormField(
              textInputType: TextInputType.visiblePassword,
              controller: context.read<RegisterCubit>().confirmPasswordController,
              hintText: "Confirm Password",
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Please enter a valid Password';
                }
              },
              obscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpacing(24),
          ],
        ));
  }
}
