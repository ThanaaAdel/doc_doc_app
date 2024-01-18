import 'package:doc_doc_app/features/auth/register_screen/logic/register/register_cubit.dart';
import 'package:doc_doc_app/features/auth/register_screen/presentaion/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login_screen/logic/login_cubit.dart';
import '../../features/auth/login_screen/presentaion/screens/login_screen.dart';
import '../../features/home_screen/presentation/home_screen.dart';
import '../../features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';
import '../di/dependacy_injection.dart';
import 'routers.dart';
class AppRouter {
Route generateRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.onBoardingScreen:
    return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen(),);
    case Routes.registerScreen:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen()),);
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen()),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("No route defind ${settings.name}")),),);
  }
}
}