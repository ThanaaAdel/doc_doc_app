import 'package:dio/dio.dart';
import 'package:doc_doc_app/features/auth/register_screen/data/repos/register_repo.dart';
import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login_screen/data/repos/login_repo.dart';
import '../../features/auth/login_screen/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  //register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));

 }