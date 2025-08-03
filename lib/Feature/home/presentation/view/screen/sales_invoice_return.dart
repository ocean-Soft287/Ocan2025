import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';

class SalesInvoiceReturn extends StatefulWidget {
  const SalesInvoiceReturn({super.key});

  @override
  State<SalesInvoiceReturn> createState() => _SalesInvoiceReturnState();
}

class _SalesInvoiceReturnState extends State<SalesInvoiceReturn> {
  String? selectedEmpId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text( "انشاء فاتورة مرتجع".tr()),),body: Column(children: [

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
            if(state is GetEmployeeSalesInvoiceByEmployeeIDLoading){return Center(child: CircularProgressIndicator());}
            if(state is GetEmployeeSalesInvoiceByEmployeeIDSuccess){
            return Text('data');
            }
     return SizedBox();
          },
        )     


    ],),);
  }
}