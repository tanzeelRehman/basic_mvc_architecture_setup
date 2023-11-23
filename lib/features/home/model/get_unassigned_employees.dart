class GetUnAssignedEmployeesResponseModel {
  GetUnAssignedEmployeesResponseModel({
    required this.statusCode,
    required this.message,
    required this.unassignedEmployeeResult,
  });
  late final int statusCode;
  late final String message;
  late final List<UnassignedEmployeeResult> unassignedEmployeeResult;

  GetUnAssignedEmployeesResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    unassignedEmployeeResult = List.from(json['UnassignedEmployeeResult'])
        .map((e) => UnassignedEmployeeResult.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['UnassignedEmployeeResult'] =
        unassignedEmployeeResult.map((e) => e.toJson()).toList();
    return data;
  }
}

class UnassignedEmployeeResult {
  UnassignedEmployeeResult({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.employeeId,
    required this.email,
  });
  late final int id;
  late final String firstName;
  late final String? lastName;
  late final String employeeId;
  late final String email;

  UnassignedEmployeeResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    employeeId = json['employee_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['employee_id'] = employeeId;
    data['email'] = email;
    return data;
  }
}
