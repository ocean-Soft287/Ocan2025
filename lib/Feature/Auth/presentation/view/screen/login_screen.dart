import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/NewOrder.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/get_all_employee_salesInvoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/order_type.dart';
import 'package:theonemaintenancetechnician/core/customwidget/custombutton.dart';
import '../widget/logo_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LogoContainer(),
              SizedBox(height: 10),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 16.w),
              //       child: Text(
              //         "Hello".tr(),
              //         style: TextStyle(
              //           fontFamily: Font.inter,
              //           fontSize: 32,
              //           fontWeight: FontWeight.w700,
              //           color: AppColors.kprimary,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
           
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 16.w),
              //       child: Text(
              //         "pleaselogin".tr(),
              //         style: TextStyle(
              //           fontFamily: Font.inter,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: AppColors.grey2,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
           
              SizedBox(height: 20),
              // CustomTextField(
              //   hintText: "اسم المستخدم",
              //   prefixIcon: Icons.person,
              // ),
              SizedBox(height: 10),
              // CustomTextField(
              //   isPassword:true,
              //   hintText: "كلمه السر",
              //   prefixIcon: Icons.lock,
              // ),
              
              SizedBox(height: 50),
              CustomButton(
                name: "انشاء طلبية ".tr(),
                width: .8 * MediaQuery.of(context).size.width,
                height: 50,
                onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderScreen(orderType: OrderType.salesInvoice,)));
             //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                },

              )
             , SizedBox(height: 20),
            //   CustomButton(

            //     name: "انشاء فاتورة مبيعات".tr(),
            //     width: .8 * MediaQuery.of(context).size.width,
            //     height: 50,
            //     onTap: () {

            //   //  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderScreen(orderType: OrderType.salesInvoiceWithoutTransfere,)));
             
            //  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

            //     },

            //   )
           
            //  , SizedBox(height: 20),
           
            //   CustomButton(

            //     name: "انشاء فاتورة مرتجع".tr(),
            //     width: .8 * MediaQuery.of(context).size.width,
            //     height: 50,
            //     onTap: () {

            //    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderScreen(orderType: OrderType.transfereInvoice,)));
            //  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

            //     },

            //   )
           
            //    , SizedBox(height: 20),

               CustomButton(

                name: "عرض الفواتير و الطلبيات".tr(),
                width: .8 * MediaQuery.of(context).size.width,
                height: 50,
                onTap: () {

               Navigator.push(context, MaterialPageRoute(builder: (context)=> GetAllEmployeeSalesinvoice()// SalesInvoice(isreturn: false,)
               ));
             //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                },

              )
             , SizedBox(height: 20),
              // CustomButton(

              //   name: "البحث عن فاتورة".tr(),
              //   width: .8 * MediaQuery.of(context).size.width,
              //   height: 50,
              //   onTap: () {

              //     Navigator.push(context,
              //         MaterialPageRoute(builder:
              //             (context)=>
              //                 SearchForInvoice()// SalesInvoice(isreturn: false,)
              //     ));
              //     //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

              //   },

              // )
              // , SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}

