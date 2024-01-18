import 'package:doc_doc_app/core/di/dependacy_injection.dart';
import 'package:doc_doc_app/core/helper/extentions.dart';
import 'package:doc_doc_app/features/auth/login_screen/logic/login_cubit.dart';
import 'package:doc_doc_app/features/auth/login_screen/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared_widgets/app_elevated_button.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocListener<LoginCubit,LoginState>(
            listener: (context, state) {
              if(state is Logout){
                context.pushNamed('/loginScreen');
              }
            },
            child: AppTextButton(
              textStyle: const TextStyle(color: Colors.white),
                textButton: 'LogOut',onPressed: (){
              context.read<LoginCubit>().emitLogoutStates();
            }),
          ),
      ],),
    )),);
  }
//   void validateThenDoLogout(BuildContext context){
//     if(context.read<LoginCubit>().formKey.currentState!.validate()){
//       context.read<LoginCubit>().emitLogoutStates();
//     }
//   }
}
