import 'package:doc_doc_app/core/helper/extentions.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/features/login_screen/logic/login_cubit.dart';
import 'package:doc_doc_app/features/login_screen/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
      state.whenOrNull(loading: (){
        showDialog(context: context, builder:
        (context) => const Center(child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),),
        );
      }, success: (loginResponse){
        context.pop();
        context.pushNamed(Routes.homeScreen);
      }, error:(error){

        setupErrorState(context, error);
      } );
    },);
  }

  void setupErrorState(BuildContext context, String error) {
      context.pop();
    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: Text(error,
          style: TextStyles.font13DarkBlueMedium,
          ),
          actions: [
            TextButton(onPressed: (){
              context.pop();
            }, child: Text('Got It ',style: TextStyles.font13BlueSemiBold,)),
          ],
          icon: const Icon(Icons.error,
          color: Colors.red,
            size: 32,
          ),
        ),);
  }
}
