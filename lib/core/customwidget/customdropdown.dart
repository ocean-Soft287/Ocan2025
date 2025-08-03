import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Font/font.dart';
import '../color/colors.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String hintText;

  final void Function(T?)? onChanged;

  const CustomDropdownField({
    super.key,
    this.value,
    required this.items,
    required this.hintText,

    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.greyd),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: Font.inter,
            fontSize: 14.sp,
            color: AppColors.grey2,
          ),
        ),
        dropdownColor: AppColors.white,
        style: TextStyle(
          fontFamily: Font.inter,
          fontSize: 14.sp,
          color: Colors.black,
        ),
        icon: Icon(
          Icons.expand_more,
          color: AppColors.kprimary,
        ),
      ),
    );
  }
}

