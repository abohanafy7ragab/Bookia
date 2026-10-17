import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WayToLogin extends StatelessWidget {
  final String imageUrl;
  final String text;
  const new({super.key,required this.imageUrl,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(imageUrl,width: 26.w,height: 26.h,fit: BoxFit.contain,),
        12.horizontalSpace,
        Text(text,style: AppTextStyle.f14darkGray,),
        ],
      ),
    );
  }
}
