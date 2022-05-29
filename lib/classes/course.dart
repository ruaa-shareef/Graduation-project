
class Course {
  int? courseNo;
  int sectionNo;
  int capacity;
  int instructorNo;
  int groupSectionId;
  String courseName;

  Course({
    this.courseNo,
    required this.sectionNo,
    required this.capacity,
    required this.instructorNo,
    required this.groupSectionId,
    required this.courseName,
  });

 // named constructor
  Course.fromJson(Map<String, dynamic> json)
      : courseNo = json['courseNo'],
        sectionNo = json['sectionNo'],
        capacity = json['capacity'],
        instructorNo = json['instructorNo'],
        groupSectionId = json['groupSectionId'],
        courseName = json['courseName'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'courseNo': courseNo,
      'sectionNo': sectionNo,
      'capacity': capacity,
      'instructorNo': instructorNo,
      'groupSectionId': groupSectionId,
      'courseName': courseName,
    };
  }
}
