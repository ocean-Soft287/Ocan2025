import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';
import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';
import '../widget/ItemCard.dart';

class SelectproductsScreen extends StatelessWidget {
  const SelectproductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
       AppBar( backgroundColor: AppColors.kprimary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('  اختيار الاصناف ',style: TextStyle(
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
                  return ItemCard(
                    imagePath: 'assets/image/samsung.jpg',
                    itemName: 'صنف',
                    itemQuantity: '20',
                    isSelectable: true,
                    isSelected: true,
                    onChecked: (val) {
                      // تغيير الحالة
                    },
                  )

                  ;
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
