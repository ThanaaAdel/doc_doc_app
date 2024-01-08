import 'package:doc_doc_app/core/Routing/routers.dart';
import 'package:doc_doc_app/features/on_boarding_screen/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/login_screen/presentaion/login_screen.dart';
class AppRouter {
Route generateRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.onBoardingScreen:
    return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => const LoginScreen(),);
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("No route defind ${settings.name}")),),);
  }
}
}