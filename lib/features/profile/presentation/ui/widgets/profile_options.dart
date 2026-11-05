import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptions extends StatelessWidget {
  final String text;
final Function()? onPressed;
 const new({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 54.h,
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          decoration: BoxDecoration(
            color: AppColors.containerLightTheme,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppTextStyle.f18Black3),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.arrow_forward_ios),
                ),
            ],
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
