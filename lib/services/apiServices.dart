import 'package:http/http.dart' as http;
import 'dart:convert';

import '../classes/attendance.dart';
import '../classes/building.dart';
import '../classes/course.dart';
import '../classes/room.dart';
import '../classes/lecturer.dart';
import '../classes/sectionsdates.dart';
import '../classes/time.dart';
import '../classes/days.dart';

class APIServices {
  final int? groupSectionId;
  final int? lecturerId;

  APIServices({
    this.groupSectionId,
    this.lecturerId
  });

  Future<List<Course>> get homeData async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/courses/${this.lecturerId}"));

    final myList = <Course>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final courses = Course.fromJson(item);
          myList.add(courses);
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

  Future<String> get courseTime async {
    var res = await http
        .get(Uri.parse("http://10.0.2.2:3000/time/${this.groupSectionId}"));

    if (res.statusCode == 200) {
      try {
        dynamic myMap = json.decode(res.body);
        print(myMap);

        if (myMap is! Map<String, dynamic>) throw FormatException();
        final time = Time.fromJson(myMap);
      } catch (error) {
        print('JSON is in the wrong format');
      }
      return "time.startTime + time.endTime";
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<bool> login(Lecturer lecturer) async {
    var res = await http.post(
      Uri.parse("http://10.0.2.2:3000/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(lecturer.toJson()),
    );

    final myList = <Lecturer>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final courses = Lecturer.fromJson(item);
          myList.add(courses);
        }

        if (myList.length >= 1) {
          return true;
        } else {
          return false;
        }
      } on FormatException {
        print('Failed to Login.');
        return false;
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> get courseRoom async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/courses/${this.lecturerId}"));

    final myList = <Course>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final courses = Course.fromJson(item);
          myList.add(courses);
        }
      } on FormatException {
        print('JSON is in the wrong format');
      }
      print(myList);
      return myList.toString();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Day>> get days async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/days"));

    final myList = <Day>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final day = Day.fromJson(item);
          myList.add(day);
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

  Future<List<Time>> get times async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/times"));

    final myList = <Time>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final time = Time.fromJson(item);
          myList.add(time);
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

  Future<List<Attendance>> get attendances async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/attendances"));

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

  Future<List<Building>> get building async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/building"));

    final myList = <Building>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final building = Building.fromJson(item);
          myList.add(building);
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

  Future<List<Course>> get courses async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/courses"));

    final myList = <Course>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final course = Course.fromJson(item);
          myList.add(course);
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

  Future<List<Room>> get rooms async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/rooms"));

    final myList = <Room>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final room = Room.fromJson(item);
          myList.add(room);
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

  Future<List<Lecturer>> get lecturers async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/lecturers"));

    final myList = <Lecturer>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final lecturer = Lecturer.fromJson(item);
          myList.add(lecturer);
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

  Future<List<SectionsDates>> get sectionsdates async {
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/sectionsdates"));

    final myList = <SectionsDates>[];
    if (res.statusCode == 200) {
      try {
        dynamic jsonList = json.decode(res.body);
        if (jsonList is! List) throw FormatException();
        for (dynamic item in jsonList) {
          if (item is! Map<String, dynamic>) continue;
          final sectionsDates = SectionsDates.fromJson(item);
          myList.add(sectionsDates);
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
}
