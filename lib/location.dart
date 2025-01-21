class Location {
  final int? id;
  final String location_code;
  final int user_id;

  Location({
    this.id,
    required this.location_code,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location_code': location_code,
      'user_id': user_id,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'],
      location_code: map['location_code'],
      user_id: map['user_id'],
    );
  }
}
