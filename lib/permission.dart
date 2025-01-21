class Permission {
  final int? id;
  final String permission_name;
  final String permission_status;
  final int user_id;

  Permission({
    this.id,
    required this.permission_name,
    required this.permission_status,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'permission_name': permission_name,
      'permission_status': permission_status,
      'user_id': user_id,
    };
  }

  factory Permission.fromMap(Map<String, dynamic> map) {
    return Permission(
      id: map['id'],
      permission_name: map['permission_name'],
      permission_status: map['permission_status'],
      user_id: map['user_id'],
    );
  }
}
