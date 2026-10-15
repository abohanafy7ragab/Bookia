import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        initialRoute:AppRoutes.loginScreen ,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}