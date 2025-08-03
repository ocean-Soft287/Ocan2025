import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/sales_invoice_card_item.dart';

class SalesInvoice extends StatefulWidget {
  final bool isreturn;
   const SalesInvoice({super.key,required this.isreturn});

  @override
  State<SalesInvoice> createState() => _SalesInvoiceState();
}

class _SalesInvoiceState extends State<SalesInvoice> {
  String? selectedEmpId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
     "عرض الفواتير و الطلبيات"),),body: Column(children: [

        BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if(state is SearchEmployeeLoadonig){return Center(child: CircularProgressIndicator());}
                      return    Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                      )
                      ),
                      
                       value: selectedEmpId,
                       hint: const Text('اختر المندوب'),
                       isExpanded: true,
                       items: context.read<HomeCubit>().employeeList
                           .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                                 value: e.empID,
                                 child: Text(e.empName),
                               ))
                           .toList(),
                       onChanged: (val) {
                         setState(() {
                          if(val==null){return;}
                           selectedEmpId = val;
                           context.read<HomeCubit>().getEmployeeSalesInvoiceByEmployeeID(id: val); 
                         });
                       },
                     ),
                   );
                     
                      },
                    ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
           final list =  context.watch<HomeCubit>().invoiceList;
           list.sort((a, b) => a.invoiceDate.compareTo(b.invoiceDate));
         final  listrev= list.reversed.toList();
          
            if(state is GetEmployeeSalesInvoiceByEmployeeIDLoading){return Center(child: CircularProgressIndicator());}
            return Expanded(child: ListView.builder(
              itemCount: listrev.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
             buildSalesInvoiceCard(context,listrev[index],widget.isreturn)
                );
              },
            ));
           
          
    
          },
        )     

    ],),);
  }
}