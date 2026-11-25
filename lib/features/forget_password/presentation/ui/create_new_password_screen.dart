import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              12.verticalSpace,
              ArrowBack(),
              28.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Create new password", style: AppTextStyle.f30Regular),
              ),
              10.verticalSpace,
              Text(
                "Your new password must be unique from those previously used.",
                style: AppTextStyle.f15dark,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}