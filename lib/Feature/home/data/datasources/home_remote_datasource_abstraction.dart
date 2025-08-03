import 'package:dartz/dartz.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/employee_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_emp_inovice_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_product_color_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_product_by_sku.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';

import '../models/get_size_model.dart';

abstract class HomeRemoteDataSource {
///Search
  Future<Either<String, List<SearchResultModel>>> search({required String keyword});
  Future<Either<String, List<SearchProductBySku>>> sarchProductBySKU({required String keyword});
  Future<Either<String, List<GetProductColorModel>>> getProductColorsBySKU({required String keyword});
  Future<Either<String, List<GetSizeModel>>> searchBySKUColor({required String searchKey,required String color});
  Future<Either<String, List<SearchResultModel>>> searchBySKUColorsize({required String searchKey,required String color,required String size});

/// GET
  Future<Either<String,  List<GetEmpInoviceModel>>> getEmployeeSalesInvoiceByEmployeeID({required String id});
  Future<Either<String,  List<GetEmpInoviceModel>>> getAllEmployeeSalesInvoice();
  Future<Either<String, List<Employee>>> getEmployees();
/// ADD
  Future<Either<String, bool>> addEmployeeSalesInvoice({required AddEmployeeSalesInvoice model});
  Future<Either<String, dynamic>> addSalesInvoiceWithoutTransfere({required AddEmployeeSalesInvoice model});
  Future<Either<String, dynamic>> addTransfereInvoice({required AddEmployeeSalesInvoice model});
 
}