class GetAssignedEmployees {
  GetAssignedEmployees({
    required this.message,
    required this.statusCode,
    required this.modifiedResult,
  });
  late final String message;
  late final int statusCode;
  late final List<ModifiedResult> modifiedResult;

  GetAssignedEmployees.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    modifiedResult = List.from(json['modifiedResult'])
        .map((e) => ModifiedResult.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['modifiedResult'] = modifiedResult.map((e) => e.toJson()).toList();
    return data;
  }
}

class ModifiedResult {
  ModifiedResult({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.employeeId,
    required this.email,
    required this.assetName,
    required this.assetId,
    this.assignDate,
    required this.status,
    required this.location,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String employeeId;
  late final String email;
  late final String assetName;
  late final String assetId;
  late final String? assignDate;
  late final bool status;
  late final String location;

  ModifiedResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    employeeId = json['employee_id'];
    email = json['email'];
    assetName = json['asset_name'];
    assetId = json['asset_id'];
    assignDate = json['assignDate'];
    status = json['status'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['employee_id'] = employeeId;
    data['email'] = email;
    data['asset_name'] = assetName;
    data['asset_id'] = assetId;
    data['assign_date'] = assignDate;
    data['status'] = status;
    data['location'] = location;
    return data;
  }
}
