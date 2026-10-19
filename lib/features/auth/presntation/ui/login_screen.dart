import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/features/auth/presntation/cubit/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presntation/ui/widgets/my_divider.dart';
import 'package:bookia/features/auth/presntation/ui/widgets/way_to_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key1 = GlobalKey<FormState>();


  String? validatePassword(String? value) {
    final v = value ?? '';
    if (v.isEmpty) return 'password required';
    if (v.length < 8) return 'password should be at least 8 charachter';
    return null;
  }

  final _emailRegex = RegExp(r'@');

  String? validateEmail(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Email required';
    if (!_emailRegex.hasMatch(v)) return 'email is worng';
    return null;
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isObscure =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is loginLaodingState) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      content: Center(child: CircularProgressIndicator()),
                    ),
                  );
                } else if (state is loginSuccessState) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.homeScreen);
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
                key: _key1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    11.verticalSpace,
                    ArrowBack(),
                    29.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome back! Glad\nto see you, Again!",
                        style: AppTextStyle.f30Regular,
                      ),
                    ),
                    32.verticalSpace,
                    TextFormField(
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
                    15.verticalSpace,
                    TextFormField(
                      obscureText: isObscure,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        final v = value ?? '';
                        if (v.isEmpty) return 'password required';
                        if (v.length < 8) return 'password should be at least 8 charachter';
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
                        hintText:"Enter your password",
                        suffixIcon: 
                             InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                child: Icon(Icons.visibility),
                              )
                            ,
                      ),
                    ),
                    13.verticalSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyle.f15dark.copyWith(
                          color: Color(0xff6A707C),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    AppButton(
                      text: "login",
                      onTap: () {
                        if (_key1.currentState!.validate()) {
                          // Navigator.pushNamed(context, AppRoutes.homeScreen);
                          context.read<AuthCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
                    ),
                    34.verticalSpace,
                    MyDivider(),
                    21.verticalSpace,
                    WayToLogin(
                      imageUrl: "assets/images/google3.png",
                      text: "Sign in with Google",
                    ),
                    15.verticalSpace,
                    WayToLogin(
                      imageUrl: "assets/images/Apple.png",
                      text: "Sign in with Apple",
                    ),
                    84.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: AppTextStyle.f15dark.copyWith(fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.registerScreen,
                            );
                          },
                          child: Text(
                            "Register Now",
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
// CustomTextFormField(
//   hintText: "Enter your email",
//   isPassword: false,
//   myKey: _key1,
//   validate: (value) {
//     validateEmail(value);
//   },
//   controller: _emailController,
// ),
// CustomTextFormField(
//   hintText: "Enter your password",
//   isPassword: true,
//   myKey: _key2,
//   validate: (value) {
//     validatePassword(value);
//   },
//   controller: _passwordController,
// ),