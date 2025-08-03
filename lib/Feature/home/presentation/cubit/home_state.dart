import 'package:theonemaintenancetechnician/Feature/home/data/models/employee_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_emp_inovice_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_product_color_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_product_by_sku._or_barCode.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import '../../data/models/get_size_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class AddEmployeeSalesInvoiceLoading extends HomeState {}

class AddEmployeeSalesInvoiceSuccess extends HomeState {}
class GetAllEmployeeSalesInvoiceLoading extends HomeState {}

class AddEmployeeSalesInvoiceFailure extends HomeState {
   String message;
  AddEmployeeSalesInvoiceFailure({required this.message});
}

class AddSalesInvoiceWithoutTransfereLoading extends HomeState {}

class AddSalesInvoiceWithoutTransfereSuccess extends HomeState {
  
}

class AddSalesInvoiceWithoutTransfereFailure extends HomeState {
   String message;
  AddSalesInvoiceWithoutTransfereFailure({required this.message});
}


class AddTransfereInvoice extends HomeState {}

class AddTransfereInvoiceLoading extends HomeState {}
class AddTransfereInvoiceSuccess extends HomeState {}


class SearchLoading extends HomeState {}    
class GetEmployeeSalesInvoiceByEmployeeIDLoading extends HomeState {}

class GetAllEmployeeSalesInvoiceSuccess extends HomeState {
  List<GetEmpInoviceModel> data;
  
  GetAllEmployeeSalesInvoiceSuccess({required this.data});
}
class GetEmployeeSalesInvoiceByEmployeeIDSuccess extends HomeState {
  List<GetEmpInoviceModel> data;
  
  GetEmployeeSalesInvoiceByEmployeeIDSuccess({required this.data});
}
class SearchError extends HomeState {
  String message;
  SearchError({required this.message});
}

class SelectItem extends HomeState {
  
}
class SelectedInvoice extends HomeState {
SearchResultModel invoiceModel;
SelectedInvoice({required this.invoiceModel});
}
class SearchEmployeeLoadonig extends HomeState {}
class SearchEmployeeSuccess extends HomeState {
  List<Employee>employees;
  SearchEmployeeSuccess({required this.employees});
}


class SearchSuccess extends HomeState {
  List<SearchResultModel> data;
  SearchSuccess({required this.data});
}

class SearchProductBySKUOrByBarCodeSucess extends HomeState{
  List<SearchProductBySkuORBarCode> data;
  SearchProductBySKUOrByBarCodeSucess({required this.data});
}
class SearchProductBySKUOrByBarCodeLoading extends HomeState{}


class SearchBySKUColorSuccess extends HomeState{
  List<GetSizeModel> data;
  SearchBySKUColorSuccess({required this.data});
}
class SearchBySKUColorLoading extends HomeState{}

class SearchBySKUColorsizerSuccess extends HomeState{
  List<SearchResultModel> data;
  SearchBySKUColorsizerSuccess({required this.data});
}
class SearchBySKUColorsizerLoading extends HomeState{}

//searchBySKUColorsize

class GetProductColorsBySKUSucess extends HomeState{
  List<GetProductColorModel> data;
  GetProductColorsBySKUSucess({required this.data});
}
class GetProductColorsBySKULoading extends HomeState{}


class SearchBySKUColorsizeSuccess extends HomeState{
  List<dynamic> data;
  SearchBySKUColorsizeSuccess({required this.data});
}
class SearchBySKUColorsizeLoading extends HomeState{}





//{required String searchKey,required String color,required String size}