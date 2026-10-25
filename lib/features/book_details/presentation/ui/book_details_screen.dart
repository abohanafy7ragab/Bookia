import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:bookia/features/book_details/presentation/ui/widgets/arrow_back_and_save.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookDetailsScreen extends StatelessWidget {
  // final Products? book;
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
            builder: (context, state) {
              if (state is BookDetailsLaoding) {
                return Skeletonizer(
                  child: Column(
                    children: [
                      82.verticalSpace,
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(7.r),
                        child: Image.network(
                          "https://www.magnific.com/free-photos-vectors/book",
                          width: 183.w,
                          height: 271.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      30.verticalSpace,
                      Text("whihidhu", style: AppTextStyle.f30Regular),
                      Text("wbjeb", style: AppTextStyle.f15gold),
                      22.verticalSpace,
                      Text(
                        "data weiuhe yweefhwefi uiebefuihwuf wu4h4 344i3e fhrrwrr  v3h4nfiun3r v3 rgu3gj3r9834n rrv 93v u24jkfn2uf w v2hfr viubf2 42h2br2ubfu2bf g2jr  ef2eej h32 2g w",
                        style: AppTextStyle.f15dark.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              } else if (state is BookDetailsSuccess) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          82.verticalSpace,
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(7.r),
                            child: Image.network(
                              state.bookDetails?.image??"",
                              width: 183.w,
                              height: 271.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          30.verticalSpace,
                          Text(
                            state.bookDetails?.name??"",
                            style: AppTextStyle.f30Regular,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            state.bookDetails?.category??"",
                            style: AppTextStyle.f15gold,
                          ),
                          22.verticalSpace,
                          Text(
                            state.bookDetails?.description??"",
                            style: AppTextStyle.f15dark.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(top: 11.h,
                    right: 0,
                    left: 0,
                     child: ArrowBackAndSave()),
                    Positioned(
                      bottom: 19.h,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$${state.bookDetails?.price??""}",
                            style: AppTextStyle.f30Regular.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          Container(
                            width: 212.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.dark,
                            ),
                            child: Center(
                              child: Text(
                                "Add To Cart",
                                style: AppTextStyle.f20regular.copyWith(
                                  color: AppColors.containerLightTheme,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text("network connection error"));
              }
            },
          ),
        ),
      ),
    );
  }
}
