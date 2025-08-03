class GetAllEmployessInvoice {
  final String customerName;
  final String customerPhone;
  final String orderAddress;

  GetAllEmployessInvoice({
    required this.customerName,
    required this.customerPhone,
    required this.orderAddress,
  });

  // Optional: Convert to Map
  Map<String, String> toMap() {
    return {
      'customerName': customerName,
      'customerPhone': customerPhone,
      'orderAddress': orderAddress,
    };
  }

  // Optional: Factory constructor from Map
  factory GetAllEmployessInvoice.fromMap(Map<String, String> map) {
    return GetAllEmployessInvoice(
      customerName: map['customerName'] ?? '',
      customerPhone: map['customerPhone'] ?? '',
      orderAddress: map['orderAddress'] ?? '',
    );
  }
}