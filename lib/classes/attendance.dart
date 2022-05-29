class Attendance {
  int? id;
  int sectionId;
  int lecturerId;
  int courseId;
  DateTime day;
  bool? attendanceDone = false;

  Attendance({
    this.id,
    required this.sectionId,
    required this.lecturerId,
    required this.courseId,
    required this.day,
    this.attendanceDone,
  });

  // named constructor
  Attendance.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sectionId = json['sectionId'],
        lecturerId = json['lecturerId'],
        courseId = json['courseId'],
        day = DateTime.parse(json['day']),
        attendanceDone = json['attendanceDone'] == 0 ? false : true;

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sectionId': sectionId,
      'lecturerId': lecturerId,
      'courseId': courseId,
      'day': day.toIso8601String(),
      'attendanceDone': attendanceDone,
    };
  }
}
