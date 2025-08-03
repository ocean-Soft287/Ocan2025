import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/images/images.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return               SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 282.h,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0D3D54),
                  Color(0xFF215FA3),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.25,
            child: Image.asset(
              Imagesassets.tools,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // اللوجو
          Image.asset(
            Imagesassets.logoappwhite,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        ],
      ),
    )
    ;
  }
}
