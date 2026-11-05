import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 6.h,
        bottom: 6.h,
        left: 10.w,
        // right: 10.w
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color:AppColors.containerLightTheme,
        border: Border.all(
          color: AppColors.border
        )
      ),
      child: Row(
        children: [
          Image.asset("assets/images/book_image.png",height: 105.h,width:94.w,fit: BoxFit.cover,),
          20.horizontalSpace,
          SizedBox(
            height: 105.h,
            width: 225.w,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("title",style:AppTextStyle.f20regular.copyWith(
                      fontSize: 18.sp
                    )),
                    Container(
                      
                      padding: EdgeInsets.all(.1.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2 
                        ),
                        borderRadius: BorderRadius.circular(13.r)
                      ),
                      child: Center(child: Icon(Icons.close)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("price",style:AppTextStyle.f15dark),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 113.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.border
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                          Text("co",style: AppTextStyle.f18Black600,),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.border
                            ),
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}