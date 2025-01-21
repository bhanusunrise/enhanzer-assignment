class Location {
  final String location_code;
  final int user_id;

  Location({
    required this.location_code,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'location_code': location_code,
      'user_id': user_id,
    };
  }
}
