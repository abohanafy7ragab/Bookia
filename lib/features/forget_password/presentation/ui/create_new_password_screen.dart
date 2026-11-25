import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passwordController = TextEditingController();

  final _passwordController2 = TextEditingController();

  bool isObscure = false;

  bool isObscure2 = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                12.verticalSpace,
                ArrowBack(),
                28.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create new password",
                    style: AppTextStyle.f30Regular,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Your new password must be unique from those previously used.",
                  style: AppTextStyle.f15dark,
                ),
                32.verticalSpace,
                TextFormField(
                  obscureText: true,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8)
                      return 'password should be at least 8 caharacters';
                    if (value != _passwordController.text)
                      return 'password do not match';
                    return null;
                  },
                  // autovalidateMode: AutovalidateMode.onUnfocus,
                  controller: _passwordController,
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
                    hintText: "New Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(Icons.visibility),
                    ),
                  ),
                ),
                12.verticalSpace,
                TextFormField(
                  obscureText: true,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8)
                      return 'password should be at least 8 caharacters';
                    return null;
                  },
                  // autovalidateMode: AutovalidateMode.onUnfocus,
                  controller: _passwordController2,
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
                    hintText: "Confirm Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure2 = !isObscure2;
                        });
                      },
                      child: Icon(Icons.visibility),
                    ),
                  ),
                ),
                38.verticalSpace,
                AppButton(
                  text: "Reset Password",
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.PasswordChangedScreen,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
