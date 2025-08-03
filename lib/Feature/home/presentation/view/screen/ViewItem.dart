import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';

import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';
class ViewitemScrren extends StatelessWidget {
  const ViewitemScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( backgroundColor: AppColors.kprimary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('  توصيل الطلبية للزبون ',style: TextStyle(
            fontFamily: Font.inter,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.white
        ),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width*.35,child: CustomTextField( margin: EdgeInsets.symmetric(horizontal: 1.w), hintText: 'الاسم', textvaidation: '',)),
                SizedBox(width: MediaQuery.sizeOf(context).width*.35,child: CustomTextField(margin: EdgeInsets.symmetric(horizontal: 1.w),hintText: 'الكود', textvaidation: '',)),
                Container(
                  width:  MediaQuery.sizeOf(context).width*.1,
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  return Container(
              
                      padding: EdgeInsets.all(8),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/image/samsung.jpg',
                            width: 40.w,
                            height: 40.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10,),
                          Column(
              
                            children: [
                              Text(
                                'صنف',
                                style: TextStyle(
                                  fontFamily: Font.inter,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12.sp,
                                  color: AppColors.ktitle,
                                ),
                              ),
                              Text(
                                '20',
                                style: TextStyle(
                                  fontFamily: Font.inter,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 8.sp,
                                  color: AppColors.ktitle,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 120.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove, size: 20.sp,color: Colors.white,),
                                  onPressed: () {
                                    // تقليل القيمة هنا
                                  },
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add, size: 20.sp,color: Colors.white),
                                  onPressed: () {
                                    // زيادة القيمة هنا
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
