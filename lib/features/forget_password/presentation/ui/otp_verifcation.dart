import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifcation extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                12.verticalSpace,
                ArrowBack(),
                28.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("OTP Verification", style: AppTextStyle.f30Regular),
                ),
                10.verticalSpace,
                Text(
                  "Enter the verification code we just sent on your email address.",
                  style: AppTextStyle.f15dark,
                ),
                35.verticalSpace,
                MaterialPinField(
                  length: 6,
                  onCompleted: (pin) => print('PIN: $pin'),
                  onChanged: (value) => print('Changed: $value'),
                  theme: MaterialPinTheme(
                    shape: MaterialPinShape.outlined,
                    cellSize: Size(48, 60),
                    borderRadius: BorderRadius.circular(8.r),
                    fillColor: AppColors.bgColor,
                    borderColor: AppColors.border,
                    filledBorderColor: AppColors.main,
                    filledFillColor: AppColors.containerLightTheme,
                    focusedFillColor: AppColors.containerLightTheme,
                    focusedBorderColor: AppColors.main,
                  ),
                ),
                35.verticalSpace,
                AppButton(
                  text: "Verify",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.createNewPasswordScreen,
                    );
                  },
                ),
                357.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t received code? ",
                      style: AppTextStyle.f15gold.copyWith(color: AppColors.dark),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Resend", style: AppTextStyle.f15gold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
