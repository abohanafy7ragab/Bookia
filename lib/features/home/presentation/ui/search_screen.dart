import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widgets/book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Column(
            children: [
              11.verticalSpace,
              ArrowBack(),
              24.verticalSpace,
              TextFormField(
                autofocus: true,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged:(value) {
                  context.read<HomeCubit>().search(value);
                },
                decoration: InputDecoration(
                  fillColor: AppColors.containerLightTheme,
                  filled: true,
                  hintText: "search",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.border)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.border)
                  ),
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is SearchLaoding) {
                      return Skeletonizer(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .50,
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
                    } else if (state is SearchSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .54,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.w,
                        ),
                        itemBuilder: (context, index) {
                          return BookItem(product: state.products?[index]);
                        },
                        itemCount: state.products?.length,
                      );
                    } else {
                      return Center(child: Text("Data is Empty"));
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
