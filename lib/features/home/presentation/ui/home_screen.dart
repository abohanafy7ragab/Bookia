import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  // final Products? product;
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/book.png",
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.contain,
                      ),
                      7.horizontalSpace,
                      Text(
                        "Bookia",
                        style: AppTextStyle.f20regular.copyWith(
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.searchScreen);
                    },
                    child: Icon(Icons.search, size: 24),
                  ),
                ],
              ),
              30.verticalSpace,
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is GetBestSellerLaoding) {
                      return Skeletonizer(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .55,
                                mainAxisSpacing: 14.h,
                                crossAxisSpacing: 18.h,
                              ),
                          itemBuilder: (context, index) {
                            return BookItem(
                              product: Products(
                                image: "https://www.magnific.com/free-photos-vectors/book",
                                name: "test",
                                price: "99",
                              ),
                            );
                          },
                          itemCount: 6,
                        ),
                      );
                    } else if (state is GetBestSellersuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .55,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.h,
                        ),
                        itemBuilder: (context, index) {
                          return BookItem(product: state.products?[index]);
                        },
                        itemCount: state.products?.length,
                      );
                    } else {
                      return Center(child: Text("Error"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
