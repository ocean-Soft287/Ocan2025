import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemQuantity;
  final int count;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final bool isSelectable;
  final bool isSelected;
  final ValueChanged<bool?>? onChecked;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.itemQuantity,
    this.count = 1,
    this.onAdd,
    this.onRemove,
    this.isSelectable = false,
    this.isSelected = false,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
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
          if (isSelectable)
            Checkbox(
              value: isSelected,
              onChanged: onChecked,
              activeColor: AppColors.kprimary,
            ),
          Image.asset(
            imagePath,
            width: 40.w,
            height: 40.w,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  fontFamily: Font.inter,
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                  color: AppColors.ktitle,
                ),
              ),
              Text(
                itemQuantity,
                style: TextStyle(
                  fontFamily: Font.inter,
                  fontWeight: FontWeight.w300,
                  fontSize: 8.sp,
                  color: AppColors.ktitle,
                ),
              ),
            ],
          ),
          const Spacer(),






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
                    icon: Icon(Icons.remove, size: 20.sp, color: Colors.white),
                    onPressed: onRemove,
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, size: 20.sp, color: Colors.white),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
