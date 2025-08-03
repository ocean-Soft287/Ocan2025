class Employee {
  final String empID;
  final String empName;

  Employee({
    required this.empID,
    required this.empName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      empID: json['EmpID'] ?? '',
      empName: json['EmpName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EmpID': empID,
      'EmpName': empName,
    };
  }
}