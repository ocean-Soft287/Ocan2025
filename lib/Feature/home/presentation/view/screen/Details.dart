import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';
import 'package:theonemaintenancetechnician/core/customwidget/custombutton.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.kprimary,
              pinned: true,
              expandedHeight: 60.h,
              title: Text('تفاصيل',style: TextStyle(
                fontFamily: Font.inter,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.white
              ),),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 10.h),

                  CustomTextField(hintText: 'الكود', textvaidation: '',),
                  SizedBox(height: 10.h),
                  CustomTextField(hintText: 'الاسم', textvaidation: '',),
                  SizedBox(height: 10.h),
                  CustomTextField(hintText: 'الفئة', textvaidation: '',),
                  SizedBox(height: 10.h),
                  CustomTextField(hintText: 'المسؤول الفني', textvaidation: '',),
                  SizedBox(height: 10.h),
                  CustomTextField(hintText: 'المشكلة', textvaidation: '',),
                  SizedBox(height: 20.h),
                  Container(
                    color: AppColors.lightblue,
                    height: 70.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('أضف صورة', style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(Icons.keyboard_arrow_down, color: AppColors.kprimary),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 200.h,
                    width: .9*MediaQuery.of(context).size.width,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(
                      'assets/image/samsung.jpg',
                      fit: BoxFit.fill, // الأفضل عشان يملأ الـ container بشكل مرتب
                      width: double.infinity,
                    ),
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(hintText: 'التاريخ', textvaidation: '',),
                  SizedBox(height: 10.h),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: AppColors.kprimary),
                    label: Text(
                      'تحميل المزيد من الصور',
                      style: TextStyle(color: AppColors.kprimary),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(name: "Save".tr(), width: .9*MediaQuery.of(context).size.width,
                        height: 45, onTap: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
