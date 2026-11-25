import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  new({super.key});
  final _emailController = TextEditingController();
  final _emailRegex = RegExp(r'@');
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: Column(
            children: [
              12.verticalSpace,
              ArrowBack(),
              30.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Forgot Password?", style: AppTextStyle.f30Regular),
              ),
              Text(
                "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                style: AppTextStyle.f16grayRegular,
              ),
              30.verticalSpace,
              BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordLaoding) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        content: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  } else if (state is ForgetPasswordSuccuss) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.OtpVerifcation);
                  } else {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      // barrierDismissible: false,
                      builder: (context) => Text("Error"),
                    );
                  }
                },
                child: Form(
                  key: key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    // obscureText: widget.isPassword && isObscure,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    validator: (value) {
                      final v = value?.trim() ?? '';
                      if (v.isEmpty) return 'Email required';
                      if (!_emailRegex.hasMatch(v)) return 'email is worng';
                      return null;
                    },
                    // autovalidateMode: AutovalidateMode.onUnfocus,
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.main),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                ),
              ),
              38.verticalSpace,
              AppButton(
                text: "Send Code",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.OtpVerifcation);
                },
              ),
              361.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember Password?",
                    style: AppTextStyle.f15gold.copyWith(color: AppColors.dark),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("login", style: AppTextStyle.f15gold),
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
