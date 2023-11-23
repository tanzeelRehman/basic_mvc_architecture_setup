class GetAllEmployeesResponseModel {
  GetAllEmployeesResponseModel({
    required this.msg,
    required this.statusCode,
    required this.result,
  });
  late final String msg;
  late final int statusCode;
  late final List<Result> result;

  GetAllEmployeesResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statusCode = json['statusCode'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['statusCode'] = statusCode;
    data['result'] = result.map((e) => e.toJson()).toList();
    return data;
  }
}

class Result {
  Result({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.employeeId,
    required this.email,
    this.assetName,
    this.assetId,
    this.assignDate,
    this.status,
    this.location,
  });
  late final int id;
  late final String firstName;
  late final String? lastName;
  late final String employeeId;
  late final String email;
  late final String? assetName;
  late final int? assetId;
  late final String? assignDate;
  late final String? status;
  late final String? location;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = null;
    employeeId = json['employee_id'];
    email = json['email'];
    assetName = json['assetName'];
    assetId = json['assetId'];
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
