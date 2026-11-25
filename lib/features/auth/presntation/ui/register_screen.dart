import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/auth/presntation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isObscure = false;

class _RegisterScreenState extends State<RegisterScreen> {
  final _key1 = GlobalKey<FormState>();

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
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterLaodingState) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      content: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else if (state is RegisterSuccessState) {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.pushNamed(context, AppRoutes.bottomNavBarScreen);
                } else if (state is RegisterErrorState) {
                  Navigator.of(context, rootNavigator: true).pop();
                  showDialog(
                    context: context,
                    // barrierDismissible: false,
                    builder: (context) => Text("Error"),
                  );
                }
              },

              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _key1,
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
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Username is required';
                        }

                        if (value.length < 3) {
                          return 'Username must be at least 3 characters';
                        }
                        return null;
                      },
                      // autovalidateMode: AutovalidateMode.onUnfocus,
                      controller: _usernameController,
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
                        hintText: "Username",
                      ),
                    ),
                    12.verticalSpace,
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'@').hasMatch(value))
                          return 'email is worng';
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
                        hintText: 'Email',
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
                        if (value.length<8)
                          return 'password should be at least 8 caharacters';
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
                        hintText: "Password",
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
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      controller: _confirmPasswordController,
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
                        hintText: "Confirm password",
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
                    30.verticalSpace,
                    AppButton(
                      text: "Register",
                      onTap: () {
                        if (_key1.currentState!.validate()) {
                          context.read<AuthCubit>().register(
                            name: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            passwordConfirmation:
                                _confirmPasswordController.text,
                          );
                          // Navigator.pushNamed(context, AppRoutes.homeScreen);
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
        ),
      ),
    );
  }
}
