
class Room {
  int? roomNo;
  int buildingNo;
  String rNo;
  String roomName;
  int capacity;
  

  Room({
    this.roomNo,
    required this.buildingNo,
    required this.rNo,
    required this.roomName,
    required this.capacity,
    
  });

   // named constructor
  Room.fromJson(Map<String, dynamic> json)
      : roomNo = json['roomNo'],
        buildingNo = json['buildingNo'],
        rNo = json['rNo'],
        roomName = json['roomName'],
        capacity = json['capacity'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'roomNo': roomNo,
      'buildingNo': buildingNo,
      'rNo': rNo,
      'roomName': roomName,
      'capacity': capacity,
    };
  }
}
