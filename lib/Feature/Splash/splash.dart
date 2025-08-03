import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/screen/splashLogin.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';
import 'package:theonemaintenancetechnician/core/utils/services/navigation_service.dart';
import '../../core/images/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تأجيل الانتقال مع إزالة Splash من الـ stack
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(const Duration(seconds: 5), () {
    //   NavigationService.pushReplacement(
    //     Splashlogin()
        
    //     );
    //   });
    // });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: -1, end: 0),
          duration: const Duration(seconds: 3),
          onEnd: () {
    Timer(Duration(seconds: 1), (){
              NavigationService.pushReplacement(Splashlogin());
    });
          },
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value * MediaQuery.of(context).size.height),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.asset(Imagesassets.logoapp),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
