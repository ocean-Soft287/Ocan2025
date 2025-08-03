import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/screen/login_screen.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/datasources/home_remote_datasource.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/datasources/home_remote_datasource_abstraction.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/employee_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_emp_inovice_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/payment_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import 'package:theonemaintenancetechnician/core/utils/services/navigation_service.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {

  HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDatasourceImp();
  HomeCubit() : super(HomeInitial());


  double total = 0;

  
  Future<void> search({required String keyword}) async {
 
      emit(SearchLoading());
      homeRemoteDataSource.search(keyword: keyword).then((value) => value.fold((l) {
        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);
        emit(SearchError(message:  l)); }, (r) => emit(SearchSuccess(data: r))));

    

  }

  
  Future<void> sarchProductBySKU({required String keyword}) async {
    emit(SearchProductBySKUOrByBarCodeLoading());



      homeRemoteDataSource.sarchProductBySKU(keyword: keyword).then((value) => value.fold((l) {
        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);
  
        emit(SearchError(message:  l)); }, (r) => emit(SearchProductBySKUOrByBarCodeSucess(data: r))));
  

  
  }
  Future<void> searchProductByBarCode({required String keyword}) async {
    emit(SearchProductBySKUOrByBarCodeLoading());



      homeRemoteDataSource.searchProductByBarCode(keyword: keyword).then((value) => value.fold((l) {

        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);

        emit(SearchError(message:  l)); }, (r) =>

          emit(SearchProductBySKUOrByBarCodeSucess(data: r))));



  }
   
   Future<void> getProductColorsBySKU({required String keyword}) async {
      emit(GetProductColorsBySKULoading());
      homeRemoteDataSource.getProductColorsBySKU(keyword: keyword).then((value) => value.fold((l) {
        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);
        emit(SearchError(message:  l)); }, (r) => emit(GetProductColorsBySKUSucess(data: r)))); 
  }
   
   
   Future<void> searchBySKUColor({required String searchKey,required String color}) async {
 
      emit(SearchBySKUColorLoading());
      homeRemoteDataSource.searchBySKUColor(searchKey: searchKey,color:color ).then((value) => value.fold((l) {
        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);
        emit(SearchError(message:  l)); }, (r) => emit(SearchBySKUColorSuccess(data: r)))); 

  }
  void selectItem(){
     emit(SelectItem());
  
  }

  void selectInvoice({required SearchResultModel invoiceModel

  }){
    emit(SelectedInvoice(invoiceModel: invoiceModel));

  }

Future<void> searchBySKUColorsize({required String searchKey,required String color,required String size}) async {
 
      emit(SearchBySKUColorsizerLoading());
      homeRemoteDataSource.searchBySKUColorsize(searchKey: searchKey,color:color,size: size ).then((value) => value.fold((l) {
        Fluttertoast.showToast(msg: l.toString(),gravity:ToastGravity.CENTER);
        emit(SearchError(message:  l)); }, (r) => emit(SearchBySKUColorsizerSuccess(data: r)))); 

  }


List<SalesInvoiceItem>productList = [];
List<SearchResultModel>items = [];
List<VariantProduct>variantList= [];
 String? selectedEmpId;
  int paymenttype = 1;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

Future<void> addEmployeeSalesInvoice({required AddEmployeeSalesInvoice model}) async {
    emit(AddEmployeeSalesInvoiceLoading());
homeRemoteDataSource.addEmployeeSalesInvoice(model: model).then((value) => value.fold((l) =>
 emit(AddEmployeeSalesInvoiceFailure(message:  l)), (r) {
  Fluttertoast.showToast(msg: "تم اضافة الطلبية بنجاح");
  
  clear();
  emit(AddEmployeeSalesInvoiceSuccess());

 }));
}
//  /searchBySKUColor
double calculateTotal() {
  total = 0;
  for (var element in productList) {
    total += element.price! * element.quantity!;
  }
return total;
}
Future<void> addSalesInvoiceWithoutTransfereLoading({required AddEmployeeSalesInvoice model}) async {
    emit(AddSalesInvoiceWithoutTransfereLoading());
homeRemoteDataSource.addSalesInvoiceWithoutTransfere(model: model).then((value) => value.fold((l) =>
 emit(AddSalesInvoiceWithoutTransfereFailure(message:  l)), (r) { 
    Fluttertoast.showToast(msg: "تم اضافة فاتورة مبيعات بنجاح");
      clear();
  emit(AddSalesInvoiceWithoutTransfereSuccess());}));
  Timer(Duration(seconds: 1), (){
      NavigationService.push(LoginScreen());

  });
  }
List<GetEmpInoviceModel>invoiceList = [];
List<GetEmpInoviceModel>allEmployessInvoiceList = [];
Future<void> getEmployeeSalesInvoiceByEmployeeID({required String id}) async {
    emit(GetEmployeeSalesInvoiceByEmployeeIDLoading());
homeRemoteDataSource.getEmployeeSalesInvoiceByEmployeeID(id: id).then((value) => value.fold((l) =>
 emit(SearchError(message:  l)), (r) { 
    invoiceList = r;

  emit(GetEmployeeSalesInvoiceByEmployeeIDSuccess (data: r));}));
  }
Future<void> addTransfereInvoice({required AddEmployeeSalesInvoice model}) async {
    emit(AddTransfereInvoiceLoading());
homeRemoteDataSource.addTransfereInvoice(model: model).then((value) => value.fold((l) =>
 emit(SearchError(message:  l)), (r) { 
      Fluttertoast.showToast(msg: "تم اضافة فاتورة مرتجع بنجاح");
     clear();
  emit(AddTransfereInvoiceSuccess());} ) );

  }
List<Employee> employeeList = [];
List<PaymentModel>paymentList = [
  PaymentModel(paymentID: 1, paymentName: 'كاش'),
  PaymentModel(paymentID: 2, paymentName: 'بطاقة ائتمان'),
];
void getEmployees() async {
    emit(SearchEmployeeLoadonig());
  final res = await homeRemoteDataSource.getEmployees();
  res.fold((l) {

    log(l);
    emit(SearchError(message:  l));}, (r) {
    employeeList = r;
    emit(SearchEmployeeSuccess( employees: r));});
  }

void clear() {
  productList.clear();
  addressController.clear();
  emailController.clear();
  firstController.clear();
  phoneController.clear();
  selectedEmpId = null;
  paymenttype=1;
}


Future<void> getAllEmployeeSalesInvoice()async{
  emit(GetAllEmployeeSalesInvoiceLoading());
  homeRemoteDataSource.getAllEmployeeSalesInvoice().then((value) => value.fold((l) =>
 emit(SearchError(message:  l)), (r) { 
    allEmployessInvoiceList = r;
  emit(GetAllEmployeeSalesInvoiceSuccess(data: r));}));
}


}
