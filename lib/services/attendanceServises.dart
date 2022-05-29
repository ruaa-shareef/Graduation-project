import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ppu_attendance/classes/attendance.dart';
import 'package:ppu_attendance/classes/attendanceStudents.dart';

class AttendanceServices {
  final int? courseNo;
  final int? sectionNo;
  final int? lecturerId;
  final int? attendanceId;

  AttendanceServices({
    this.courseNo,
    this.sectionNo,
    this.lecturerId,
    this.attendanceId,
  });

  Future<List<Attendance>> get attendances async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/attendances/${this.lecturerId}/${this.courseNo}/${this.sectionNo}"));

    final myList = <Attendance>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final attendance = Attendance.fromJson(item);
          myList.add(attendance);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Attendance> get attendancesBylecturer async {
    var res = await http
        .get(Uri.parse("http://10.0.2.2:3000/attendances/${this.lecturerId}"));

    final myList = <Attendance>[];

    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final attendance = Attendance.fromJson(item);
          myList.add(attendance);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList.first;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<int?> createAttendance(Attendance attendance) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/attendance/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(attendance.toJson()),
    );

    if (response.statusCode == 200) {
      var res =
          await http.get(Uri.parse("http://10.0.2.2:3000/attendance/last"));
      final myList = <Attendance>[];
      if (res.statusCode == 200) {
        try {
          dynamic jsonList = json.decode(res.body);
          if (jsonList is! List) throw FormatException();
          for (dynamic item in jsonList) {
            if (item is! Map<String, dynamic>) continue;
            final attendance = Attendance.fromJson(item);
            myList.add(attendance);
          }
        } on FormatException {
          print('JSON is in the wrong format');
        }
        print(myList);
        return myList.first.id;
      } else {
        throw Exception('Failed to load album');
      }
    } else {
      print(response.body);
      throw Exception('Failed to create Attendance.');
    }
  }

// /attendance/last
  Future<String> createAttendanceStudents(List<Map<String, dynamic>> attendanceStudent) async {
   
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/attendancestudents/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(attendanceStudent),
    );

    if (response.statusCode == 200) {
      return "Done";
    } else {
      print(response.body);
      throw Exception('Failed to create Attendance.');
    }
  }


  
  Future<List<AttendanceStudents>> get attendanceStudent async {
    var res = await http
        .get(Uri.parse("http://10.0.2.2:3000/attendancestudent/${this.attendanceId}"));

    final myList = <AttendanceStudents>[];

    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final studentList = AttendanceStudents.fromJson(item);
          myList.add(studentList);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList;
    } else {
      throw Exception('Failed to load Students Attendance List');
    }
  }
}
