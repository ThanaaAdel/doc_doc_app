
import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/register_request_body.dart';
import '../../data/repos/register_repo.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _RegisterRepo;
  RegisterCubit(this._RegisterRepo) : super (const RegisterState.initial());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController =TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    final formKey = GlobalKey<FormState>();

  void emitRegisterStates(RegisterRequestBody registerRequestBody)async{
    emit(const RegisterState.loading());
    final response = await _RegisterRepo.register(registerRequestBody);
    response.when(success: (registerResponse){
      emit(RegisterState.success(registerResponse));

    },
        failure: (error){
      emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
