import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangedScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
        child: Column(
          children: [
            248.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/Successmark.jpg",
                width: 100.w,
                height: 100.h,
              ),
            ),
            35.verticalSpace,
            Text("Password Changed!", style: AppTextStyle.f30Regular),
            3.verticalSpace,
            Text(
              "Your password has been changed",
              style: AppTextStyle.f16grayRegular,
            ),
            Text("successfully.", style: AppTextStyle.f16grayRegular),
            40.verticalSpace,
            AppButton(
              text: "Back to Login",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginScreen,
                  (j) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
