import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/local_helper/local_helper.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/utils/app_contants.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/profile/data/models/profile_response.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/features/profile/presentation/ui/widgets/profile_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileData? profile;
  const new({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                20.horizontalSpace,
                Text(
                  "data",
                  style: AppTextStyle.f20regular.copyWith(fontSize: 24.sp),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("do you want to log out"),
                        content: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: AppButton(
                                  text: "Confirm",
                                  onTap: () {
                                    LocalHelper.prefs?.remove(
                                      AppContants.token,
                                    );
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutes.loginScreen,
                                      (e) => false,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: AppTextStyle.f15dark,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.logout, size: 20),
                ),
              ],
            ),
            28.verticalSpace,
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is GetProfileLaoding) {
                  return Skeletonizer(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: Image.asset("assets/images/Apple.png")
                              .image,
                          radius: 40,
                        ),
                        13.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "fhghg fkfg",
                              style: AppTextStyle.f20regular,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "igjhghjg kjgkhj",
                              style: AppTextStyle.f14darkGray.copyWith(
                                color: AppColors.gray,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state is GetProfileSuccess) {
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.network(profile?.image ?? "")
                            .image,
                        radius: 40,
                      ),
                      13.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile?.name ?? "",
                            style: AppTextStyle.f20regular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            profile?.email ?? "",
                            style: AppTextStyle.f14darkGray.copyWith(
                              color: AppColors.gray,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  );
                }else{
                  return SizedBox(
                    height: 80.h,
                    child: Text("Error")
                  );
                }
              },
            ),
            35.verticalSpace,
            ProfileOptions(text: "My Orders", onPressed: () {}),
            ProfileOptions(text: "Edit Profile", onPressed: () {}),
            ProfileOptions(text: "Reset Password", onPressed: () {}),
            ProfileOptions(text: "FAQ", onPressed: () {}),
            ProfileOptions(text: "Contact Us", onPressed: () {}),
            ProfileOptions(text: "Privacy & Terms", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
