
import 'package:doc_doc_app/core/helper/extentions.dart';
import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_cubit.dart';
import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
class RegisterBlocListener extends StatefulWidget {
  const RegisterBlocListener({super.key});

  @override
  State<RegisterBlocListener> createState() => _RegisterBlocListenerState();
}

class _RegisterBlocListenerState extends State<RegisterBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
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