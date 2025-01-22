class Data {
  final int? id;
  final String user_display_name;
  final String user_email;
  final String user_employee_code;
  final String user_company_code;
  final String location_code;
  final String permission_name;
  final String permission_status;

  Data({this.id, required this.user_display_name, required this.user_email, required this.user_company_code, required this.user_employee_code, required this.location_code, required this.permission_name, required this.permission_status});

  Map<String, dynamic> toMap() {
    return {'id': id, 'user_display_name': user_display_name, 'user_email': user_email, 'user_company_code' : user_company_code, 'user_employee_code' : user_employee_code, 'location_code' : location_code, 'oermission_name' : permission_name, 'permission_status' : permission_status};

  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
        id: map['id'],
        user_display_name: map['user_display_name'],
        user_email: map['user_email'],
        user_company_code: map['user_company_code'],
        user_employee_code: map['user_employee_code'],
        location_code:  map['location_code'],
        permission_name: map['permission_name'],
        permission_status: map['permission_status']
    );
  }
}