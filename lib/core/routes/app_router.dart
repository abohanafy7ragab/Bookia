import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/features/auth/presntation/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      
    }
  }
}