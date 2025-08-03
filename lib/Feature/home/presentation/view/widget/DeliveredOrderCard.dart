import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';

class DeliveredOrderCard extends StatelessWidget {
  final String clientNumber;
  final String clientName;
  final String clientAddress;
  final String itemCode;
  final String itemPrice;
  final String itemQuantity;
  final String itemBranch;
  final VoidCallback? onSelectItems;
  final bool isDelivered;


  const DeliveredOrderCard({
    super.key,
    required this.clientNumber,
    required this.clientName,
    required this.clientAddress,
    required this.itemCode,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemBranch,
    this.onSelectItems,
    required this.isDelivered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      padding: EdgeInsets.all(20),
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
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'معلومات العميل',
                      style: TextStyle(
                        fontFamily: Font.inter,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                        color: AppColors.ktitle,
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.black),
                  ],
                ),

                SizedBox(height: 6.h),


                Text('رقم العميل : $clientNumber', style: _textStyle()),
                Text('اسم العميل : $clientName', style: _textStyle()),
                Text('العنوان : $clientAddress', style: _textStyle()),

                SizedBox(height: 10.h),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الاصناف',
                      style: TextStyle(
                        fontFamily: Font.inter,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                        color: AppColors.ktitle,
                      ),
                    ),
                    GestureDetector(
                      onTap: onSelectItems,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.ktitle,
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: Text( isDelivered?
                          'اختيار الاصناف':'عرض الاصناف',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),


                Text('الكود : $itemCode', style: _textStyle()),
                Text('السعر: $itemPrice', style: _textStyle()),
                Text('الكمية: $itemQuantity', style: _textStyle()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الفرع المصدر للصنف: $itemBranch',
                      style: _textStyle(),
                    ),
                    isDelivered
                        ? Text(
                      'تم التسليم',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                        fontSize: 14.sp,
                      ),
                    )
                        : Row(
                      children: [
                        GestureDetector(
                          onTap: onSelectItems,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'موافقه',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'رفض',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle() => TextStyle(
    fontFamily: Font.inter,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.geryText,
  );
}