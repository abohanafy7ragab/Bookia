import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle f30Regular = TextStyle(
    fontSize: 30.sp,color: AppColors.dark
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: 15.sp,color: AppColors.gray
  );
  static TextStyle f20regular = TextStyle(
    fontSize: 20.sp,color: AppColors.dark
  );
  static TextStyle mainButtonTextStyle = TextStyle(
    fontSize: 15.sp,color: Colors.white
  );
  static TextStyle f15dark = TextStyle(
    fontSize: 15.sp,color: AppColors.dark
  );
  static TextStyle f14darkGray = TextStyle(
    color: AppColors.darkGray
  );
  static TextStyle bookTitleItem = TextStyle(
    color: AppColors.dark,fontSize: 18.sp
  );
  static TextStyle bookPriceItem = TextStyle(
    color: AppColors.dark,fontSize: 16.sp
  );
  static TextStyle f15gold = TextStyle(
    color: AppColors.main,fontSize: 15.sp
  );
  
}
