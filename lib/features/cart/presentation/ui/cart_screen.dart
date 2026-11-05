import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/cart/presentation/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            children: [
              11.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Text("My cart",style: AppTextStyle.f20regular.copyWith(fontSize: 24.sp),)),
              56.verticalSpace,
              CartItem(),
              
            ],
          ),
        ),
      ),
    );
  }
}