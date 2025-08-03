import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';
import '../../../../../core/customwidget/custombutton.dart';
import '../widget/DeliveredOrderCard.dart';
import 'DeliverToCustomer.dart';
import 'SelectProducts.dart';

class DeliveredOrdersScrren extends StatelessWidget {
  const DeliveredOrdersScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kprimary,
        centerTitle: true,
        title: Text(
          'تسليم الطلبيه',
          style: TextStyle(
            fontFamily: Font.inter,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return DeliveredOrderCard(
                  clientNumber: '659084',
                  clientName: 'محمد فتحي',
                  clientAddress: 'القاهرة , مصر',
                  itemCode: '9jjbk8',
                  itemPrice: '3000',
                  itemQuantity: '20pc',
                  itemBranch: 'قنا',
                  isDelivered: true,
                  onSelectItems: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectproductsScreen()),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              name: "Save".tr(),
              width: .9 * MediaQuery.of(context).size.width,
              height: 45,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveredToCustomerScrren()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
