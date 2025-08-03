import 'dart:ui';
import '../color/colors.dart';
import '../sizeconfig.dart';
import 'font.dart';
import 'package:flutter/material.dart';

// بدل ما تسميها FontStyle (وده اسم موجود في Flutter)
class AppFontStyle {
  static TextStyle login(BuildContext context) {
    return TextStyle(
      fontFamily: Font.inter,
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: AppColors.white,
    );
  }

  static double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    var dispatcher = PlatformDispatcher.instance;
    var physicalWidth = dispatcher.views.first.physicalSize.width;
    var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    double width = physicalWidth / devicePixelRatio;

    if (width < SizeConfig.tablet) {
      return width / 550;
    } else if (width < SizeConfig.desktop) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }
}
