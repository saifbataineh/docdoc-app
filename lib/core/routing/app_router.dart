import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/ui/home_screen.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/ui/login_screen.dart';
import 'package:flutter_advanced/features/onBorading/onborading_screen.dart';
import 'package:flutter_advanced/features/signUp/logic/sign_up_cubit.dart';
import 'package:flutter_advanced/features/signUp/ui/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboradingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>  HomeCubit(getIt())..getSpecialization(),
                  child: const HomeScreen(),
                ));
      default:
        return null;
    }
  }
}
