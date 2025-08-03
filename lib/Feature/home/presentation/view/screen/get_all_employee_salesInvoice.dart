import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/create_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/order_type.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';

class GetAllEmployeeSalesinvoice extends StatefulWidget {
  const GetAllEmployeeSalesinvoice({super.key});

  @override
  State<GetAllEmployeeSalesinvoice> createState() => _GetAllEmployeeSalesinvoiceState();
}

class _GetAllEmployeeSalesinvoiceState extends State<GetAllEmployeeSalesinvoice> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllEmployeeSalesInvoice();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.bblack),
            ),
        backgroundColor: Colors.white,
        title: Text("طلبيات المندوبين".tr()),
        
    )
   , body:BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
  final cubit = context.read<HomeCubit>();
        if(state is GetAllEmployeeSalesInvoiceLoading){return Center(child: CircularProgressIndicator(),);}
        return ListView.builder(
          itemCount: cubit.allEmployessInvoiceList.length,
          itemBuilder: (context, index) {
            final item = cubit.allEmployessInvoiceList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
              CreateSalesInvoice(orderType: OrderType.salesInvoiceWithoutTransfere, item: item,))),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.shade200,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                              Icon(Icons.person,size: 15,),
                          SizedBox(width: 5,),
                          Text(item.customerName.toString())
                     ,
                     
                     
                        ],)
                      
                      ,   Row(
                        children: [
                          Icon(Icons.phone,size: 15,),
                          SizedBox(width: 5,),
                          Text(item.customerPhone.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.house_outlined,size: 15,),
                          SizedBox(width: 5,),
                     Expanded(child: Text(item.orderAddress.toString(),maxLines: 3,)),
                       
                        ],
                      ),
                       
                      ],
                                     
                      
                    
                    ),
                  ),
                ),
              ),
            );
          }
       
        );
      
      },
   
    )
    
    );
  }
}