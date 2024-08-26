import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  DocApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(375, 812),
      minTextAdapt: true,
      child:MaterialApp(
        title: 'Doc App',
        theme:ThemeData(
          primaryColor:ColorsManager.mainBlue ,
          scaffoldBackgroundColor: Colors.white,
          
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoardingScreen,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
