class StudentsQuize {
  int? id;
  int studentId;
  int quizeId;
  int mark;

  StudentsQuize({
    this.id,
    required this.studentId,
    required this.quizeId,
    required this.mark,
  });

  // named constructor
  StudentsQuize.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        studentId = json['studentId'],
        quizeId = json['quizeId'],
        mark = json['mark'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'quizeId': quizeId,
      'mark': mark,
    };
  }
}
