class User {
  final int? id;
  final String user_display_name;
  final String user_email;
  final String user_employee_code;
  final String user_company_code;

  User({this.id, required this.user_display_name, required this.user_email, required this.user_company_code, required this.user_employee_code});

  Map<String, dynamic> toMap() {
    return {'id': id, 'user_display_name': user_display_name, 'user_email': user_email, 'user_company_code' : user_company_code, 'user_employee_code' : user_employee_code};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      user_display_name: map['user_display_name'],
      user_email: map['user_email'],
      user_company_code: map['user_company_code'],
      user_employee_code: map['user_employee_code']
    );
  }
}