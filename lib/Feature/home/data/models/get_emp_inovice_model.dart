import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';

class GetEmpInoviceModel {
  final int invoiceTypeId;
  final int invoiceNo;
  final DateTime invoiceDate;
  final DateTime invoiceTime;
  final int? customerID;
  final String? customerName;
  final String? customerPhone;
  final int currencyID;
  final double currencyRate;
  final String currencyArName;
  final String currencyEnName;
  final String? notes;
  final double totalVal;
  final int totalQty;
  final String branchID;
  final String branchArName;
  final String branchEnName;
  final int costCenterID;
  final int payType;
  final double totalDiscount;
  final double totalExtra;
  final double? firstPay;
  final double profits;
  final bool isPosted;
  final String employeeID;
  final String employeeArName;
  final String employeeEnName;
  final double returnCash;
  final int? shiftNo;
  final double finalValue;
  final int? receivedReciptID;
  final double? receivedReciptValue;
  final int? reservationNO;
  final int? itemsAccount;
  final int? pointOfSaleCustID;
  final bool? isCustomerPoint;
  final double? tax;
  final int? customerOrderID;
  final String? frmNum;
  final String? countryName;
  final String? regionName;
  final String? districtName;
  final String? block;
  final String? street;
  final String? house;
  final String? gada;
  final String? floor;
  final String? apartment;
  final String? orderAddress;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? extraDirections;
  final String? passportID;
  final String? zipCode;
  final List<SalesInvoiceItem> salesInvoiceItems;

  GetEmpInoviceModel({
    required this.invoiceTypeId,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.invoiceTime,
    this.customerID,
    this.customerName,
    this.customerPhone,
    required this.currencyID,
    required this.currencyRate,
    required this.currencyArName,
    required this.currencyEnName,
    this.notes,
    required this.totalVal,
    required this.totalQty,
    required this.branchID,
    required this.branchArName,
    required this.branchEnName,
    required this.costCenterID,
    required this.payType,
    required this.totalDiscount,
    required this.totalExtra,
    this.firstPay,
    required this.profits,
    required this.isPosted,
    required this.employeeID,
    required this.employeeArName,
    required this.employeeEnName,
    required this.returnCash,
    this.shiftNo,
    required this.finalValue,
    this.receivedReciptID,
    this.receivedReciptValue,
    this.reservationNO,
    this.itemsAccount,
    this.pointOfSaleCustID,
    this.isCustomerPoint,
    this.tax,
    this.customerOrderID,
    this.frmNum,
    this.countryName,
    this.regionName,
    this.districtName,
    this.block,
    this.street,
    this.house,
    this.gada,
    this.floor,
    this.apartment,
    this.orderAddress,
    this.firstName,
    this.lastName,
    this.email,
    this.extraDirections,
    this.passportID,
    this.zipCode,
    required this.salesInvoiceItems,
  });

  factory GetEmpInoviceModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? itemsJson = json['SalesInvoiceItems'] as List?;
    List<SalesInvoiceItem> items = itemsJson
        ?.map((item) => SalesInvoiceItem.fromJson(item))
        .toList() ??
        [];

    return GetEmpInoviceModel(
      invoiceTypeId: json['InvoiceTypeId'] ?? 0,
      invoiceNo: json['InvoiceNo'] ?? 0,
      invoiceDate: DateTime.parse(json['InvoiceDate']),
      invoiceTime: DateTime.parse(json['InvoiceTime']),
      customerID: json['CustomerID'],
      customerName: json['CustomerName'],
      customerPhone: json['CustomerPhone'],
      currencyID: json['CurrencyID'] ?? 0,
      currencyRate: (json['CurrencyRate'] ?? 0.0).toDouble(),
      currencyArName: json['CurrencyArName'] ?? '',
      currencyEnName: json['CurrencyEnName'] ?? '',
      notes: json['Notes'],
      totalVal: (json['TotalVal'] ?? 0.0).toDouble(),
      totalQty: json['TotalQty'] ?? 0,
      branchID: json['BranchID'] ?? '',
      branchArName: json['BranchArName'] ?? '',
      branchEnName: json['BranchEnName'] ?? '',
      costCenterID: json['CostCenterID'] ?? 0,
      payType: json['PayType'] ?? 0,
      totalDiscount: (json['TotalDiscount'] ?? 0.0).toDouble(),
      totalExtra: (json['TotalExtra'] ?? 0.0).toDouble(),
      firstPay: (json['FirstPay'] as num?)?.toDouble(),
      profits: (json['Profits'] ?? 0.0).toDouble(),
      isPosted: json['IsPosted'] ?? false,
      employeeID: json['EmployeeID'] ?? '',
      employeeArName: json['EmployeeArName'] ?? '',
      employeeEnName: json['EmployeeEnName'] ?? '',
      returnCash: (json['ReturnCash'] ?? 0.0).toDouble(),
      shiftNo: json['ShiftNo'],
      finalValue: (json['FinalValue'] ?? 0.0).toDouble(),
      receivedReciptID: json['ReceivedReciptID'],
      receivedReciptValue: (json['ReceivedReciptValue'] as num?)?.toDouble(),
      reservationNO: json['ReservationNO'],
      itemsAccount: json['ItemsAccount'],
      pointOfSaleCustID: json['PointOfSaleCustID'],
      isCustomerPoint: json['IsCustomerPoint'],
      tax: (json['Tax'] as num?)?.toDouble(),
      customerOrderID: json['CustomerOrderID'],
      frmNum: json['FrmNum'],
      countryName: json['CountryName'],
      regionName: json['RegionName'],
      districtName: json['DistrictName'],
      block: json['Block'],
      street: json['Street'],
      house: json['House'],
      gada: json['Gada'],
      floor: json['Floor'],
      apartment: json['Apartment'],
      orderAddress: json['OrderAddress'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      extraDirections: json['ExtraDirections'],
      passportID: json['PassportID'],
      zipCode: json['ZIPCode'],
      salesInvoiceItems: items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'InvoiceTypeId': invoiceTypeId,
      'InvoiceNo': invoiceNo,
      'InvoiceDate': invoiceDate.toIso8601String(),
      'InvoiceTime': invoiceTime.toIso8601String(),
      'CustomerID': customerID,
      'CustomerName': customerName,
      'CustomerPhone': customerPhone,
      'CurrencyID': currencyID,
      'CurrencyRate': currencyRate,
      'CurrencyArName': currencyArName,
      'CurrencyEnName': currencyEnName,
      'Notes': notes,
      'TotalVal': totalVal,
      'TotalQty': totalQty,
      'BranchID': branchID,
      'BranchArName': branchArName,
      'BranchEnName': branchEnName,
      'CostCenterID': costCenterID,
      'PayType': payType,
      'TotalDiscount': totalDiscount,
      'TotalExtra': totalExtra,
      'FirstPay': firstPay,
      'Profits': profits,
      'IsPosted': isPosted,
      'EmployeeID': employeeID,
      'EmployeeArName': employeeArName,
      'EmployeeEnName': employeeEnName,
      'ReturnCash': returnCash,
      'ShiftNo': shiftNo,
      'FinalValue': finalValue,
      'ReceivedReciptID': receivedReciptID,
      'ReceivedReciptValue': receivedReciptValue,
      'ReservationNO': reservationNO,
      'ItemsAccount': itemsAccount,
      'PointOfSaleCustID': pointOfSaleCustID,
      'IsCustomerPoint': isCustomerPoint,
      'Tax': tax,
      'CustomerOrderID': customerOrderID,
      'FrmNum': frmNum,
      'CountryName': countryName,
      'RegionName': regionName,
      'DistrictName': districtName,
      'Block': block,
      'Street': street,
      'House': house,
      'Gada': gada,
      'Floor': floor,
      'Apartment': apartment,
      'OrderAddress': orderAddress,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'ExtraDirections': extraDirections,
      'PassportID': passportID,
      'ZIPCode': zipCode,
      'SalesInvoiceItems': salesInvoiceItems.map((item) => item.toJson()).toList(),
    };
  }
}