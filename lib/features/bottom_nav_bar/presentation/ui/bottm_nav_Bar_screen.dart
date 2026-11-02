import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BottmNavBarScreen extends StatefulWidget {
  new({super.key});

  @override
  State<BottmNavBarScreen> createState() => _BottmNavBarScreenState();
}

class _BottmNavBarScreenState extends State<BottmNavBarScreen> {
  int index = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()..getBestSellerBooks(),
      child: HomeScreen(),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.main,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: AppColors.main),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            activeIcon: Icon(Icons.bookmark, color: AppColors.main),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart, color: AppColors.main),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person, color: AppColors.main),
            label: ""
          ),
        ],
        backgroundColor: AppColors.containerLightTheme,
      ),
    );
  }
}
