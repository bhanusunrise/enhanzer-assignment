class Location {
  final int? id;
  final String location_code;


  Location({this.id, required this.location_code});

  Map<String, dynamic> toMap() {
    return {'id': id, 'location_code': location_code};
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
        id: map['id'],
        location_code: map['location_code'],
    );
  }
}