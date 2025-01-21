class Permission {
  final String permission_name;
  final String permission_status;
  final int user_id;

  Permission({
    required this.permission_name,
    required this.permission_status,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'permission_name': permission_name,
      'permission_status': permission_status,
      'user_id': user_id,
    };
  }
}
