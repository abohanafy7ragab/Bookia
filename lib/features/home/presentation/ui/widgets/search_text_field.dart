

import 'package:bookia/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String?)? onChanged;
  const new({super.key,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.containerLightTheme,
        filled: true,
        hintText: "search",
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.border)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.border)
        ),
      ),
    );
  }
}