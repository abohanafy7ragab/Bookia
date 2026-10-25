

import 'package:bookia/features/book_details/presentation/ui/widgets/arrow_back_and_save.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            11.verticalSpace,
            ArrowBackAndSave(),
            
          ],
        ),
      ),
    );
  }
}