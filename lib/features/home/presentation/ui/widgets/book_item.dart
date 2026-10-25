import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Products? product;
  const new({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.bookDetailsScreen,
        arguments: product?.id
        );
      },
      child: Container(
        width: 163.w,
        height: 281.h,
        color: AppColors.containerLightTheme,
        child: Padding(
          padding: EdgeInsets.only(
            top: 12.h,
            right: 11.w,
            left: 11.w,
            bottom: 12.h,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  product?.image ?? "",
                  width: 141.w,
                  height: 176.h,
                  fit: BoxFit.cover,
                ),
              ),
              21.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product?.name ?? "",
                  style: AppTextStyle.bookTitleItem,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              8.23.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product?.price ?? ""}",
                    style: AppTextStyle.bookPriceItem,
                  ),
                  Container(
                    width: 73.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text("buy", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
