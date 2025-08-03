import 'package:flutter/material.dart';
import '../Font/fontstyle.dart';
import '../color/colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
     this.width,
     this.height,
    required this.onTap,
    this.color,
    this.borderRadius,

  });

  final String name;
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,

        decoration: BoxDecoration(
          color: color ?? AppColors.kprimary,
          borderRadius: BorderRadius.circular(borderRadius??10),
        ),
        child: Text(
          
          name,
          style: AppFontStyle.login(context),
        ),
      ),
    );
  }
}

