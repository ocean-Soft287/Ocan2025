import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/Details.dart';
import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';
import '../widget/MaintenanceCard.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

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
              title: Text(
                'التاسكات',
                style: TextStyle(
                  fontFamily: Font.inter,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double screenWidth = MediaQuery.of(context).size.width;

                      // Determine layout type
                      bool isTabletOrWeb = screenWidth > 600;

                      final statuses = [
                        {'text': 'تمت الصيانة', 'color': Colors.green},
                        {'text': 'لم يتم البدء بعد', 'color': Colors.red},
                        {'text': 'جاري العمل عليه', 'color': Colors.amber},
                        {'text': 'تمت الصيانة', 'color': Colors.green},
                      ];

                      if (isTabletOrWeb) {
                        // Use GridView for larger screens
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: statuses.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 1.8,
                          ),
                          itemBuilder: (context, index) {
                            return MaintenanceCard();
                          },
                        );
                      } else {
                        // Use ListView for small screens
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: statuses.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            return MaintenanceCard();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
