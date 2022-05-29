class AttendanceStudents {
  int? id;
  int studentId;
  int attendanceId;
  bool absence;

  AttendanceStudents({
    this.id,
    required this.studentId,
    required this.attendanceId,
    required this.absence,
  });

  // named constructor
  AttendanceStudents.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        studentId = json['studentId'],
        attendanceId = json['attendanceId'],
        absence = json['absence'] == 0 ? false : true;

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'attendanceId': attendanceId,
      'absence': absence,
    };
  }
}
