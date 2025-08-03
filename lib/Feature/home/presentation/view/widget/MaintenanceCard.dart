import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final status = {
      'text': 'تمت الصيانة',
      'color': Colors.green,
    };

    return Container(
      height: 150.h,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.asset(
                          'assets/image/samsung.jpg',
                          width: 80.w,
                          height: 80.w,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AS15006',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: status['color'] as Color,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        status['text'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'العنوان: إصلاح مكيف',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'التاريخ: 10 مارس 2025',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'الفني المسؤول: محمد فتحي',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
