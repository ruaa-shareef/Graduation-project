class Building {
  int? buildingNo;
  String buildingName;
  String notes;

  Building({
    this.buildingNo,
    required this.buildingName,
    required this.notes,
  });

  // named constructor
  Building.fromJson(Map<String, dynamic> json)
      : buildingNo = json['buildingNo'],
        buildingName = json['buildingName'],
        notes = json['notes'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'buildingNo': buildingNo,
      'buildingName': buildingName,
      'notes': notes,
    };
  }
}
