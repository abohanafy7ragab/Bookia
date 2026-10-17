import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key1 = GlobalKey<FormState>();

  final _key2 = GlobalKey<FormState>();

  final _key3 = GlobalKey<FormState>();

  final _key4 = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is removed from the tree
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                11.verticalSpace,
                ArrowBack(),
                29.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello! Register to get\nstarted",
                    style: AppTextStyle.f30Regular,
                  ),
                ),
                32.verticalSpace,
                CustomTextFormField(
                  hintText: "Username",
                  isPassword: false,
                  myKey: _key1,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (value.length < 4) {
                      return 'Username must be between 4 or more';
                    }
                    return null;
                  },
                  controller: _usernameController,
                ),
                12.verticalSpace,
                CustomTextFormField(
                  hintText: "Email",
                  isPassword: false,
                  myKey: _key2,
                  validate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'@').hasMatch(value)) return 'email is worng';
                    return null;
                  },
                  controller: _emailController,
                ),
                12.verticalSpace,
                CustomTextFormField(
                  hintText: "Password",
                  isPassword: true,
                  myKey: _key3,
                  validate: (value) {
                    final v = value ?? '';
                    if (v.isEmpty) return 'password required';
                    if (v.length < 8)
                      return 'password should be at least 8 charachter';
                    return null;
                  },
                  controller: _passwordController,
                ),
                12.verticalSpace,
                CustomTextFormField(
                  hintText: "Confirm password",
                  isPassword: true,
                  myKey: _key4,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                ),
                30.verticalSpace,
                AppButton(
                  text: "Register",
                  onTap: () {
                    if (_key1.currentState!.validate() &&
                        _key2.currentState!.validate() &&
                        _key3.currentState!.validate() &&
                        _key4.currentState!.validate()) {
                      Navigator.pushNamed(context, AppRoutes.homeScreen);
                    }
                  },
                ),
                193.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTextStyle.f15dark.copyWith(fontSize: 14.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login Now",
                        style: AppTextStyle.f14darkGray.copyWith(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
