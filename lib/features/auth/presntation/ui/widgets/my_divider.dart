

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            endIndent: 16.w,
          )
        ),
        Text("Or",style: TextStyle(color: Color(0xff6A707C)),),
        Expanded(
          child: Divider(
            thickness: 1,
            indent: 16.w,
          )
        )
      ],
    );
  }
}