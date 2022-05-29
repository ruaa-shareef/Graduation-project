class Quize {
  int? id;
  String name;
  int sectionId;
  int lecturerId;
  int courseId;
  DateTime day;

  Quize({
    this.id,
    required this.sectionId,
    required this.name,
    required this.lecturerId,
    required this.courseId,
    required this.day,
  });

  // named constructor
  Quize.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sectionId = json['sectionId'],
        name = json['name'],
        lecturerId = json['lecturerId'],
        courseId = json['courseId'],
        day = DateTime.parse(json['day']);

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sectionId': sectionId,
      'name': name,
      'lecturerId': lecturerId,
      'courseId': courseId,
      'day': day.toIso8601String(),
    };
  }
}
