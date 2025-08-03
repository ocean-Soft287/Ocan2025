import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String textvaidation;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final bool readOnly;
  final EdgeInsetsGeometry? margin;
  final void Function(String)? onChanged;
  final void  Function(String)? onFieldSubmitted;
  final int? maxlines;

  const CustomTextField({
    super.key,
    this.maxlines,
    this.onFieldSubmitted,
    this.controller,
    this.readOnly = false,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.onChanged,
    this.margin, required this.textvaidation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.greyd),
      ),
     
      child: TextFormField(
        onTap: (){

        controller?.clear();
        },
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ;
          }
          return null;
        },maxLines: maxlines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: Font.inter,
            fontSize: 14.sp,
            color: AppColors.grey2,
          ),
          icon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.grey2) : null,
        ),
     
      ),
    );
  }
}
