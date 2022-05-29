
class Student {
  int? id;
  int studentNo;
  String studentNameArabic;
  int academicYear;
  int semesterNo;
  int courseNo;
  int sectionNo;

  Student({
    this.id,
    required this.studentNo,
    required this.studentNameArabic,
    required this.academicYear,
    required this.semesterNo,
    required this.courseNo,
    required this.sectionNo,
  });

   // named constructor
  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        studentNo = json['studentNo'],
        studentNameArabic = json['studentNameArabic'],
        academicYear = json['academicYear'],
        semesterNo = json['semesterNo'],
        courseNo = json['courseNo'],
        sectionNo = json['sectionNo'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentNo': studentNo,
      'studentNameArabic': studentNameArabic,
      'academicYear': academicYear,
      'semesterNo': semesterNo,
      'courseNo': courseNo,
      'sectionNo': sectionNo,
    };
  }
}
