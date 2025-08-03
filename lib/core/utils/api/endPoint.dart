import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';

class EndPoint {
  static String baseUrl ="http://37.34.250.195:9292/OceanAPINew/api"; //"http://78.89.159.126:9393/TheOneAPIRehana/api";

  /// auth
  static String login = "$baseUrl/Member/loginMember";
  static String forgetpassw = "$baseUrl/Member/forgotpassword";
  static String changePassconfirm = "$baseUrl/Member/resetpassword";
  static String logout = "$baseUrl/Member/logout";
  /// invitation
  static String recurring = "$baseUrl/Invitation/recurring";
  static String oneTime = "$baseUrl/Invitation/oneTime";
  static String group = "$baseUrl/Invitation/group";
  /// get info about invitation
  static String invitation = "$baseUrl/Member/byStatus?status=";
  static String addFamilyDependant = "$baseUrl/Member/addFamilyDependant";
  static String getfammilydata = "$baseUrl/Member/familyDependants";
  static String deletememberid = "$baseUrl/Member/";
  static String familydependts = "$baseUrl/Member/familyDependants";

  /// chat
  static String chat = "$baseUrl/Chat/messages";
  static String sendmessage ="$baseUrl/Chat/sendMessage";
 
 /// بحث الاصناف 
 static String search ({required String searchKey})=> "$baseUrl/Product/SearchProducts?searchKey=$searchKey"; 
 ///بحث برثم الكمبيوتر
 static String sarchProductBySKU ({required String searchKey})=> '$baseUrl/Product/SearchProductBySKU?SKU=$searchKey';
 ///بيرجع الالوان لرقم الكمبيوتر
 static String getProductColorsBySKU ({required String searchKey})=> '$baseUrl/Product/GetProductColorsBySKU?SKU=$searchKey';
 ///المقاسات لرقم كمبيوتر ولون
 static String searchBySKUColor ({required String searchKey,required String color})=> '$baseUrl/Product/SearchBySKUColor?SKU=$searchKey&color=$color';
///الكميات للرقم واللون والمقاس
 static String searchBySKUColorsize ({required String searchKey,required String color,required String size})=> '$baseUrl/Product/SearchBySKUColorsize?SKU=$searchKey&color=$color&size=$size';


///اضافة طلبية المندوب
static String addEmployeeSalesInvoice =  "$baseUrl/EmployeeSales/AddEmployeeSalesInvoice";
///  بترجع طلبيات المندوب بال ID
static String getEmployeeSalesInvoiceByEmployeeID ({required String id})=> "$baseUrl/EmployeeSales/GetEmployeeSalesInvoiceByEmployeeID?EmployeeID=$id";
///اضاةفة فاتورة مبيعات
static String addSalesInvoiceWithoutTransfere= "$baseUrl/SalesInvoice/AddSalesInvoiceWithoutTransfere";
///فاتورة مراجع
static String addTransfereInvoice =   "$baseUrl/SalesInvoice/AddTransfereInvoice";
///بترجع كل طلبيات
static String getAllEmployeeSalesInvoice = "$baseUrl/EmployeeSales/GetAllEmployeeSalesInvoice";

/// Sales Inventory Model 
static Map<String, dynamic> getEmployeeSalesInvoiceByEmployeeBody ({required AddEmployeeSalesInvoice model})=> model.toJson();

/// Get Employees
static String getEmployees = "$baseUrl/Employees/GetEmployees";



}
