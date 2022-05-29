class Day {
  int? dayNo;
  String aName;
  String eName;

  Day({
    this.dayNo,
    required this.aName,
    required this.eName,
  });

  // named constructor
  Day.fromJson(Map<String, dynamic> json)
      : dayNo = json['dayNo'],
        aName = json['aName'],
        eName = json['eName'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'dayNo': dayNo,
      'aName': aName,
      'eName': eName,
    };
  }
}
