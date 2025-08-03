import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/salesInvoiceCardItem.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';

class SelectedItems extends StatefulWidget {
  const SelectedItems({super.key, });

  @override
  State<SelectedItems> createState() => _SelectedItemsState();
}

class _SelectedItemsState extends State<SelectedItems> {
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    final cubit =  context.watch <HomeCubit>().productList;
    return Scaffold(
      backgroundColor: Colors.white,
     appBar:      AppBar(
            backgroundColor: AppColors.kprimary,
            title: Text('عرض الاصناف',style: TextStyle(color: AppColors.white),),
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          ),

      body:_isloading ? Center(child: CircularProgressIndicator(color: AppColors.kprimary,),) :
         Column(
           children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: infoRow(Icons.money, 'Total Products price', context.read<HomeCubit>().calculateTotal().toString()),
                        ),

             Expanded(child: bodyforState(cubit)),
           ],
         )
   
    );
  }

  Widget bodyforState(List<SalesInvoiceItem> cubit) {
    return cubit.isEmpty?Center(child: Text('لا يوجد اصناف'),) :
            ListView.builder(
    itemCount:  cubit.length,
    itemBuilder: (context, index) {

      final item = cubit[index];

   return

       buildSalesInvoiceItemCard(context, item,(){
          setState(() {
        _isloading = true;// 
         Timer(Duration(seconds: 1), () {
setState(() {
  cubit.removeAt(index);
             _isloading = false;

});
           });
       
         
         });
       
       
       });

    },

  );
  }
  Widget bodyforPassingdata(List<SalesInvoiceItem> cubit) {
    return cubit.isEmpty?Center(child: Text('لا يوجد اصناف'),) :
            ListView.builder(
    itemCount:  cubit.length,
    itemBuilder: (context, index) {

      final item = cubit[index];

   return

       buildSalesInvoiceItemCard(context, item,(){
         setState(() {
           cubit.removeAt(index);

         });

       });

    },

  );
  }

}