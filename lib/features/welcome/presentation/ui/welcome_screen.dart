import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/welcome/presentation/ui/widgets/register_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, //important
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset("assets/images/welcome.png").image,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              135.verticalSpace,
              Image.asset("assets/images/splash.png"),
              28.verticalSpace,
              Text("Order Your Book Now!", style: AppTextStyle.f20regular),
              333.verticalSpace,
              AppButton(
                text: "login",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
              ),
              15.verticalSpace,
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
