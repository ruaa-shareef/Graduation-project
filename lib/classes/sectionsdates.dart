class SectionsDates {
  int? id;
  int roomDay;
  int groupSectionId;
  

  SectionsDates({
    this.id,
    required this.roomDay,
    required this.groupSectionId,
    
  });

   // named constructor
  SectionsDates.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        roomDay = json['roomDay'],
        groupSectionId = json['groupSectionId'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomDay': roomDay,
      'groupSectionId': groupSectionId,
    };
  }
}
