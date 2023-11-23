class GetAssignedAssets {
  GetAssignedAssets({
    required this.message,
    required this.statusCode,
    required this.user,
    required this.assets,
    required this.totalAssetsAssigned,
  });
  late final String message;
  late final int statusCode;
  late final User user;
  late final List<Assets> assets;
  late final int totalAssetsAssigned;

  GetAssignedAssets.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    user = User.fromJson(json['user']);
    assets = List.from(json['assets']).map((e) => Assets.fromJson(e)).toList();
    totalAssetsAssigned = json['total_assets_assigned'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['user'] = user.toJson();
    data['assets'] = assets.map((e) => e.toJson()).toList();
    data['total_assets_assigned'] = totalAssetsAssigned;
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.employeeId,
    required this.email,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String employeeId;
  late final String email;

  User.fromJson(Map<String, dynamic> json) {
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

class Assets {
  Assets({
    required this.assetName,
    required this.assetsType,
    required this.location,
    required this.status,
    required this.assignDate,
    required this.asset_id,
  });
  late final String assetName;
  late final String assetsType;
  late final String location;
  late final bool status;
  late final String? assignDate;
  late final String asset_id;

  Assets.fromJson(Map<String, dynamic> json) {
    assetName = json['asset_name'];
    assetsType = json['assets_type'];
    location = json['location'];
    status = json['status'];
    assignDate = json['assign_date'];
    asset_id = json['asset_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['asset_name'] = assetName;
    data['assets_type'] = assetsType;
    data['location'] = location;
    data['status'] = status;
    data['assign_date'] = assignDate;
    data['asset_id'] = asset_id;
    return data;
  }
}
