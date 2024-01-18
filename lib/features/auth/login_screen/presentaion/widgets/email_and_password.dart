import 'password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }
  void setupPasswordControllerListener(){
 passwordController.addListener(() {
   setState(() {
     hasLowerCase = AppRex.hasLowerCase(passwordController.text);
     hasUpperCase = AppRex.hasUpperCase(passwordController.text);
     hasNumber = AppRex.hasNumber(passwordController.text);
     hasMinLength = AppRex.isMinLength(passwordController.text);
     hasSpecialCharacters = AppRex.hasSpecialCharacter(passwordController.text);
   });
 });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty || !AppRex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            verticalSpacing(25),
            AppTextFormField(
              hintText: "Password",
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Please enter a valid Password';
                }
              },
              controller:
                  context.read<LoginCubit>().passwordController,
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
             PasswordValidations(
               hasLowerCase: hasLowerCase,
               hasMinLength: hasMinLength,
               hasNumber: hasNumber,
               hasSpecialCharacters: hasSpecialCharacters,
               hasUpperCase: hasUpperCase,
             ),
          ],
        ));
  }
}
