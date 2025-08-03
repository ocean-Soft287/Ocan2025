import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';

class TitleItem extends StatelessWidget {
  final String title;

  const TitleItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: Font.inter,
          fontWeight: FontWeight.w800,
          fontSize: 14. sp,
          color: AppColors.ktitle,
        ),
      ),
    );
  }
}
