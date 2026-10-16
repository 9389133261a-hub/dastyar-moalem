class Student {
  final String id;
  final String name;
  final String? photoUrl;
  final String parentPhone;
  final String classId;

  Student({
    required this.id,
    required this.name,
    this.photoUrl,
    required this.parentPhone,
    required this.classId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'parentPhone': parentPhone,
        'classId': classId,
      };

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        name: json['name'],
        photoUrl: json['photoUrl'],
        parentPhone: json['parentPhone'],
        classId: json['classId'],
      );
}

class ClassSchedule {
  final String id;
  final String subject;
  final String day; // شنبه, یکشنبه, ...
  final String startTime;
  final String endTime;
  final String classId;

  ClassSchedule({
    required this.id,
    required this.subject,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.classId,
  });
}

class AttendanceRecord {
  final String studentId;
  final DateTime date;
  final String status; // حاضر, غایب, تأخیر

  AttendanceRecord({
    required this.studentId,
    required this.date,
    required this.status,
  });
}

class Grade {
  final String id;
  final String studentId;
  final String subject;
  final double score;
  final DateTime date;
  final String type; // کلاسی, مستمر, امتحان

  Grade({
    required this.id,
    required this.studentId,
    required this.subject,
    required this.score,
    required this.date,
    required this.type,
  });
}

class Contact {
  final String id;
  final String name;
  final String phone;
  final String relation; // والد, همکار, مدیر, اضطراری

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.relation,
  });
}

class Homework {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final String classId;
  final bool isCompleted;

  Homework({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.classId,
    this.isCompleted = false,
  });
}

class AppEvent {
  final String id;
  final String title;
  final DateTime date;
  final String description;

  AppEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
  });
}