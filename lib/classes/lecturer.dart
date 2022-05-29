class Lecturer {
  int supervisorNo;
  String supervisorArabicName;
  

  Lecturer({
    required this.supervisorNo,
    required this.supervisorArabicName,
  });

   // named constructor
  Lecturer.fromJson(Map<String, dynamic> json)
      : supervisorNo = json['supervisorNo'],
        supervisorArabicName = json['supervisorArabicName'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'supervisorNo': supervisorNo,
      'supervisorArabicName': supervisorArabicName,
    };
  }
}
