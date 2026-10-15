import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  const new({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text("login", style: AppTextStyle.mainButtonTextStyle),
      ),
    );
  }
}
