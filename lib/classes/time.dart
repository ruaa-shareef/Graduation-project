class Time {
  int? id;
  int acdYear;
  int semesterNo;
  int roomNo;
  int buildingNo;
  int startTime;
  int endTime;

  Time({
    this.id,
    required this.acdYear,
    required this.semesterNo,
    required this.roomNo,
    required this.buildingNo,
    required this.startTime,
    required this.endTime,
  });

  // named constructor
  Time.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        acdYear = json['acdYear'],
        semesterNo = json['semesterNo'],
        roomNo = json['roomNo'],
        buildingNo = json['buildingNo'],
        startTime = json['startTime'],
        endTime = json['endTime'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'acdYear': acdYear,
      'semesterNo': semesterNo,
      'roomNo': roomNo,
      'buildingNo': buildingNo,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
