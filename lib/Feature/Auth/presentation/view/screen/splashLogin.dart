import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/core/customwidget/custombutton.dart';

import '../../../../../core/images/images.dart';
import 'login_screen.dart';


class Splashlogin extends StatelessWidget {
  const Splashlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Imagesassets.logoapp, height: 170.h),
CustomButton(name: "ابدا الان".tr(), width: 239,
    height: 45, onTap: (){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }),
          ],
        ),
      ),
    );
  }
}
