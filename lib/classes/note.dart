class Note {
  int? id;
  String name;
  String body;
  int lecturerId;
  DateTime day;

  Note({
    this.id,
    required this.name,
    required this.body,
    required this.day,
    required this.lecturerId,
  });

  // named constructor
  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        body = json['body'],
        lecturerId = json['lecturerId'],
        day = DateTime.parse(json['day']);

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'body': body,
      'lecturerId': lecturerId,
      'day': day.toIso8601String(),
    };
  }
}
