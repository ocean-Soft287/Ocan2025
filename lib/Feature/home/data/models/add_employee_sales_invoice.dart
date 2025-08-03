class AddEmployeeSalesInvoice {
  final double currencyRate;
  final String notes;
  final int employeeID;
  final bool isCustomerPoint;
  final double tax;
  final double totalDiscount;
  final double totalVal;
  final double finalValue;
  final int totalQty;
  final double totalExtra;
  final String countryName;
  final String regionName;
  final String districtName;
  final String block;
  final String street;
  final String house;
  final String gada;
  final String floor;
  final String apartment;
  final String orderAddress;
  final String customerPhone;
  final String firstName;
  final String lastName;
  final String email;
  final String extraDirections;
  final String passportID;
  final List<SalesInvoiceItem> salesInvoiceItems;
  final List<SalesInvoicePayment> salesInvoicePayments;
  final List<dynamic> coupons;

  AddEmployeeSalesInvoice({
    required this.currencyRate,
    required this.notes,
    required this.employeeID,
    required this.isCustomerPoint,
    required this.tax,
    required this.totalDiscount,
    required this.totalVal,
    required this.finalValue,
    required this.totalQty,
    required this.totalExtra,
    required this.countryName,
    required this.regionName,
    required this.districtName,
    required this.block,
    required this.street,
    required this.house,
    required this.gada,
    required this.floor,
    required this.apartment,
    required this.orderAddress,
    required this.customerPhone,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.extraDirections,
    required this.passportID,
    required this.salesInvoiceItems,
    required this.salesInvoicePayments,
    required this.coupons,
  });

  factory AddEmployeeSalesInvoice.fromJson(Map<String, dynamic> json) {
    var itemsList = json['SalesInvoiceItems'] as List;
    List<SalesInvoiceItem> items = itemsList
        .map((item) => SalesInvoiceItem.fromJson(item))
        .toList();

    var paymentsList = json['SalesInvoicePayments'] as List;
    List<SalesInvoicePayment> payments = paymentsList
        .map((item) => SalesInvoicePayment.fromJson(item))
        .toList();

    return AddEmployeeSalesInvoice(
      currencyRate: json['CurrencyRate'],
      notes: json['Notes'],
      employeeID: json['EmployeeID'],
      isCustomerPoint: json['IsCustomerPoint'],
      tax: json['Tax'].toDouble(),
      totalDiscount: json['TotalDiscount'].toDouble(),
      totalVal: json['TotalVal'].toDouble(),
      finalValue: json['FinalValue'].toDouble(),
      totalQty: json['TotalQty'],
      totalExtra: json['TotalExtra'].toDouble(),
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
      customerPhone: json['CustomerPhone'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      extraDirections: json['ExtraDirections'],
      passportID: json['PassportID'],
      salesInvoiceItems: items,
      salesInvoicePayments: payments,
      coupons: json['Coupons'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CurrencyRate': currencyRate,
      'Notes': notes,
      'EmployeeID': employeeID,
      'IsCustomerPoint': isCustomerPoint,
      'Tax': tax,
      'TotalDiscount': totalDiscount,
      'TotalVal': totalVal,
      'FinalValue': finalValue,
      'TotalQty': totalQty,
      'TotalExtra': totalExtra,
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
      'CustomerPhone': customerPhone,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'ExtraDirections': extraDirections,
      'PassportID': passportID,
      'SalesInvoiceItems': salesInvoiceItems.map((i) => i.toJson()).toList(),
      'SalesInvoicePayments': salesInvoicePayments.map((p) => p.toJson()).toList(),
      'Coupons': coupons,
    };
 
  }
}

class SalesInvoiceItem {
  final String? barCode;
  final bool? isOutput;
  final int? itemID;
  final int? quantity;
  final double? price;
  final double? cost;
  final String? branchID;
  final dynamic employeeID;
  final dynamic notes;
  final double? discountVal;
  final int? priceType;
  final double? profits;
  final int? giftQuantity;
  final int? currencyID;
  final double? currencyRate;
  final String? sku;
  final double? finalPrice;
  final int? retrenQuantity;
  final double? currentPrice;
  final dynamic state;
  final dynamic updateState;
  final int? salesInvoiceNo;
  final int? salesInvoiceID;
  final int? salesOldInvoiceNo;
  final int? salesOldInvoiceID;
  final int? salesOldInvoiceQty;

  SalesInvoiceItem({
    this.barCode,
    this.isOutput,
    this.itemID,
    this.quantity,
    this.price,
    this.cost,
    this.branchID,
    this.employeeID,
    this.notes,
    this.discountVal,
    this.priceType,
    this.profits,
    this.giftQuantity,
    this.currencyID,
    this.currencyRate,
    this.sku,
    this.finalPrice,
    this.retrenQuantity,
    this.currentPrice,
    this.state,
    this.updateState,
    this.salesInvoiceNo,
    this.salesInvoiceID,
    this.salesOldInvoiceNo,
    this.salesOldInvoiceID,
    this.salesOldInvoiceQty,
  });

  factory SalesInvoiceItem.fromJson(Map<String, dynamic> json) {
    return SalesInvoiceItem(
      barCode: json['BarCode']?.toString(),
      isOutput: json['IsOutput'] as bool?,
      itemID: json['ItemID'] as int?,
      quantity: json['Quantity'] as int?,
      price: (json['Price'] is num) ? json['Price'].toDouble() : null,
      cost: (json['Cost'] is num) ? json['Cost'].toDouble() : null,
      branchID: json['BranchID']?.toString(),
      employeeID: json['EmployeeID'],
      notes: json['Notes'],
      discountVal: (json['DiscountVal'] is num) ? json['DiscountVal'].toDouble() : null,
      priceType: json['PriceType'] as int?,
      profits: (json['Profits'] is num) ? json['Profits'].toDouble() : null,
      giftQuantity: json['GiftQuantity'] as int?,
      currencyID: json['CurrencyID'] as int?,
      currencyRate: (json['CurrencyRate'] is num) ? json['CurrencyRate'].toDouble() : null,
      sku: json['SKU']?.toString(),
      finalPrice: (json['FinalPrice'] is num) ? json['FinalPrice'].toDouble() : null,
      retrenQuantity: json['ReternQuantity'] as int?,
      currentPrice: (json['CurrentPrice'] is num) ? json['CurrentPrice'].toDouble() : null,
      state: json['State'],
      updateState: json['UpdateState'],
      salesInvoiceNo: json['SalesInvoiceNo'] as int?,
      salesInvoiceID: json['SalesInvoiceID'] as int?,
      salesOldInvoiceNo: json['SalesOldInvoiceNo'] as int?,
      salesOldInvoiceID: json['SalesOldInvoiceID'] as int?,
      salesOldInvoiceQty: json['SalesOldInvoiceQty'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BarCode': barCode,
      'IsOutput': isOutput,
      'ItemID': itemID,
      'Quantity': quantity,
      'Price': price,
      'Cost': cost,
      'BranchID': branchID,
      'EmployeeID': employeeID,
      'Notes': notes,
      'DiscountVal': discountVal,
      'PriceType': priceType,
      'Profits': profits,
      'GiftQuantity': giftQuantity,
      'CurrencyID': currencyID,
      'CurrencyRate': currencyRate,
      'SKU': sku,
      'FinalPrice': finalPrice,
      'ReternQuantity': retrenQuantity,
      'CurrentPrice': currentPrice,
      'State': state,
      'UpdateState': updateState,
      'SalesInvoiceNo': salesInvoiceNo,
      'SalesInvoiceID': salesInvoiceID,
      'SalesOldInvoiceNo': salesOldInvoiceNo,
      'SalesOldInvoiceID': salesOldInvoiceID,
      'SalesOldInvoiceQty': salesOldInvoiceQty,
    };
  }
}

class SalesInvoicePayment {
  final int paymentTypeID;
  final dynamic payTypeArName;
  final dynamic payTypeEnName;
  final String approvalNo;
  final double value;
  final dynamic cardNo;

  SalesInvoicePayment({
    required this.paymentTypeID,
    this.payTypeArName,
    this.payTypeEnName,
    required this.approvalNo,
    required this.value,
    this.cardNo,
  });

  factory SalesInvoicePayment.fromJson(Map<String, dynamic> json) {
    return SalesInvoicePayment(
      paymentTypeID: json['PaymentTypeID'],
      payTypeArName: json['PayTypeArName'],
      payTypeEnName: json['PayTypeEnName'],
      approvalNo: json['ApprovalNo'],
      value: json['Value'].toDouble(),
      cardNo: json['CardNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PaymentTypeID': paymentTypeID,
      'PayTypeArName': payTypeArName,
      'PayTypeEnName': payTypeEnName,
      'ApprovalNo': approvalNo,
      'Value': value,
      'CardNo': cardNo,
    };
  }
}