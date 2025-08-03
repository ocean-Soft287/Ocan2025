import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/search_for_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/selected_items.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/order_type.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/title.dart' show TitleItem;
import 'package:uuid/uuid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/search_by_code.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/card_number_input.dart';
import '../../../../../core/Font/font.dart';
import '../../../../../core/color/colors.dart';
import '../../../../../core/customwidget/custombutton.dart';
class NewOrderScreen extends StatefulWidget {
 final OrderType orderType;
  const NewOrderScreen({super.key, required this.orderType});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
 

  @override
  void initState() {
    //     context.read<HomeCubit>()
    // .getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
final cubit  = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,),),
            backgroundColor: AppColors.kprimary,
            pinned: true,
            expandedHeight: 60.h,
            title: 
            Text(
            appbarTitle(widget.orderType),
              style: TextStyle(
                fontFamily: Font.inter,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            centerTitle: true,
        actions: [
        TextButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedItems() ));
          }, child: Text('عرض الاصناف',style: TextStyle(fontSize: 16,color: Colors.white),))


        ],
          ),
          SliverToBoxAdapter(
            child: Form(
              key: cubit. formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TitleItem(title: 'معلومات العميل'),
                  ),
           SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'اسم العميل',
                    controller:cubit. firstController,
                    textvaidation: 'برجاء ادخال اسم العميل',
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'رقم العميل',
                    controller:cubit. phoneController,
                    textvaidation: 'برجاء ادخال رقم العميل',
                  ),
                 
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'العنوان',
                    controller:cubit. addressController,
                    textvaidation: 'برجاء ادخال العنوان',
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'البريد الالكتروني',
                    controller:cubit. emailController,
                    textvaidation: 'برجاء  البريد الالكتروني',
                  ),
          
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleItem(title: 'الاصناف'),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            //SelectproductsScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SearchForInvoice() // SearchScreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.ktitle,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Text(
                              'اختيار الاصناف',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      'تحديد المندوب',
                      style: TextStyle(
                        fontFamily: Font.inter,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                        color: AppColors.ktitle,
                      ),
                    ),
                  ),
          
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is SearchEmployeeLoadonig) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.ktitle),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
          
                          value:cubit. selectedEmpId,
                          hint: const Text('اختر المندوب'),
                          isExpanded: true,
                          items:
                              context
                                  .read<HomeCubit>()
                                  .employeeList
                                  .map<DropdownMenuItem<String>>(
                                    (e) => DropdownMenuItem<String>(
                                      value: e.empID,
                                      child: Text(e.empName),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (val) {
                            setState(() {
                              if (val == null) {
                                return;
                              }
                           cubit.   selectedEmpId = val;
                            });
                          },
                        ),
                      );
                    },
                  ),
          
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleItem(title: ' طريقة الدفع'),
                        DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.ktitle),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
          
                          value:cubit. paymenttype,
                          hint: const Text('اختر طريقة الدفع'),
                          isExpanded: true,
                          items:
                              context
                                  .read<HomeCubit>()
                                  .paymentList
                                  .map<DropdownMenuItem<int>>(
                                    (e) => DropdownMenuItem<int>(
                                      value: e.paymentID,
                                      child: Text(e.paymentName),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (val) {
                            setState(() {
                              if (val == null) {
                                return;
                              }
                         cubit.     paymenttype = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
               cubit.   paymenttype == 2
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CardNumberInput(
                          controller:cubit. cardNumberController,
                        ),
                      )
                      : SizedBox(),
          
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is AddEmployeeSalesInvoiceLoading || state is AddTransfereInvoiceLoading || state is AddSalesInvoiceWithoutTransfereLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return CustomButton(
                          name: "انشاء".tr(),
                          //   width: .9 * MediaQuery.of(context).size.width,
                          height: 45,
                          onTap: () {
                            if (cubit. formKey.currentState!.validate()) {
                              
                              logic(context, cubit);
                            
                            }
          
                         
                         
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logic(BuildContext context, HomeCubit cubit) {
      if (context
        .read<HomeCubit>()
        .productList
        .isNotEmpty) {
      if (cubit. selectedEmpId != null) {
      
    if(widget.orderType == OrderType.salesInvoice){
          context
            .read<HomeCubit>()
         
            .addEmployeeSalesInvoice(
              model: model(cubit, context),
            );}
                                else if(widget.orderType == OrderType.transfereInvoice){
       context
            .read<HomeCubit>()

            .addTransfereInvoice(
              model: model(cubit, context),
            );

                                }
                                else if(widget.orderType == OrderType.salesInvoiceWithoutTransfere){
       context
            .read<HomeCubit>()
         
            .addSalesInvoiceWithoutTransfereLoading(
              model: model(cubit, context),
            );
                                
        
                                
                          
                                
    }
      } else {
        Fluttertoast.showToast(
          msg: 'يرجى اختيار المندوب',
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: 'يرجى اختيار الاصناف',
      );
    }
                                
  }

  AddEmployeeSalesInvoice model(HomeCubit cubit, BuildContext context) {
    return AddEmployeeSalesInvoice(
                                        currencyRate: 1,
                                        notes:
                                            'Order#${removeHyphens(Uuid().v4())}#${DateFormat('yyyyMMdd').format(DateTime.now())}}',
                                        employeeID: int.parse(
                                       cubit.   selectedEmpId!,
                                        ),
                                        isCustomerPoint: false,
                                        tax: 0,
                                        totalDiscount: 0,
                                        totalVal:
                                            context
                                                .read<HomeCubit>()
                                                .calculateTotal(),
                                        finalValue:
                                            context
                                                .read<HomeCubit>()
                                                .calculateTotal(),
                                        totalQty:
                                            context
                                                .read<HomeCubit>()
                                                .employeeList
                                                .length,
                                        totalExtra: 0,
                                        countryName: '',
                                        regionName: '',
                                        districtName: '',
                                        block: '',
                                        street: '',
                                        house: '',
                                        gada: '',
                                        floor: '',
                                        apartment: '',
                                        orderAddress:
                                         cubit. addressController.text,
                                        customerPhone:cubit.phoneController.text,
                                        firstName:cubit. firstController.text,
                                        lastName: '',
                                        email: cubit.emailController.text,
                                        extraDirections: '',
                                        passportID: '',
                                        salesInvoiceItems:
                                            context
                                                .read<HomeCubit>()
                                                .productList,
                                        salesInvoicePayments: [
                                          SalesInvoicePayment(
                                            cardNo: '',
                                            paymentTypeID:widget.orderType == OrderType.salesInvoiceWithoutTransfere?
                                           2: cubit. paymenttype,
                                            approvalNo: removespaces(cubit. cardNumberController.text),
                                            value:
                                                context
                                                    .read<HomeCubit>()
                                                    .calculateTotal(),
                                          ),
                                        ],
                                        coupons: [],
                                      );
  }
  
String appbarTitle(OrderType type) {
  switch (type) {
    case OrderType.salesInvoice:
      return "انشاء طلبية ";
    case OrderType.salesInvoiceWithoutTransfere:
      return "انشاء فاتورة مبيعات";
    case OrderType.transfereInvoice:
      return "انشاء فاتورة مرتجع";
  }
} 

String removeHyphens(String input) {
  return input.replaceAll('-', '');
}
String removespaces(String input) {
  return input.replaceAll(' ', '');
}
}

