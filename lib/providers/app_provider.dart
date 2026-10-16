import 'package:flutter/material.dart';
import '../models/models.dart';

class AppProvider extends ChangeNotifier {
  List<Student> students = [];
  List<ClassSchedule> schedules = [];
  List<AttendanceRecord> attendances = [];
  List<Grade> grades = [];
  List<Contact> contacts = [];
  List<Homework> homeworks = [];
  List<AppEvent> events = [];
  bool isPremium = false;
  String currentClassId = 'class1';

  AppProvider() {
    _loadSampleData();
  }

  void _loadSampleData() {
    students = [
      Student(id: '1', name: 'علی رضایی', parentPhone: '09121234567', classId: 'class1'),
      Student(id: '2', name: 'زهرا محمدی', parentPhone: '09129876543', classId: 'class1'),
      Student(id: '3', name: 'محمد حسینی', parentPhone: '09131112222', classId: 'class1'),
      Student(id: '4', name: 'فاطمه کریمی', parentPhone: '09134445555', classId: 'class1'),
    ];

    schedules = [
      ClassSchedule(id: '1', subject: 'فارسی', day: 'شنبه', startTime: '08:00', endTime: '08:45', classId: 'class1'),
      ClassSchedule(id: '2', subject: 'ریاضی', day: 'شنبه', startTime: '09:00', endTime: '09:45', classId: 'class1'),
      ClassSchedule(id: '3', subject: 'علوم', day: 'یکشنبه', startTime: '08:00', endTime: '08:45', classId: 'class1'),
      ClassSchedule(id: '4', subject: 'قرآن', day: 'یکشنبه', startTime: '09:00', endTime: '09:45', classId: 'class1'),
    ];

    contacts = [
      Contact(id: '1', name: 'والد علی رضایی', phone: '09121234567', relation: 'والد'),
      Contact(id: '2', name: 'مدیر مدرسه', phone: '02112345678', relation: 'مدیر'),
      Contact(id: '3', name: 'همکار خانم احمدی', phone: '09125556677', relation: 'همکار'),
    ];

    homeworks = [
      Homework(id: '1', title: 'تمرین ریاضی صفحه ۴۵', description: 'حل تمرین‌های ۱ تا ۱۰', dueDate: DateTime.now().add(const Duration(days: 2)), classId: 'class1'),
      Homework(id: '2', title: 'انشا فارسی', description: 'نوشتن انشا با موضوع پاییز', dueDate: DateTime.now().add(const Duration(days: 5)), classId: 'class1'),
    ];

    events = [
      AppEvent(id: '1', title: 'جلسه اولیا', date: DateTime.now().add(const Duration(days: 3)), description: 'ساعت ۱۰ صبح'),
      AppEvent(id: '2', title: 'امتحان ریاضی', date: DateTime.now().add(const Duration(days: 7)), description: 'میان‌ترم'),
    ];

    notifyListeners();
  }

  void togglePremium() {
    isPremium = !isPremium;
    notifyListeners();
  }

  void addStudent(Student student) {
    students.add(student);
    notifyListeners();
  }

  void updateAttendance(String studentId, DateTime date, String status) {
    attendances.removeWhere((a) => a.studentId == studentId && a.date.day == date.day && a.date.month == date.month);
    attendances.add(AttendanceRecord(studentId: studentId, date: date, status: status));
    notifyListeners();
  }

  String getAttendanceStatus(String studentId, DateTime date) {
    final record = attendances.firstWhere(
      (a) => a.studentId == studentId && a.date.day == date.day && a.date.month == date.month,
      orElse: () => AttendanceRecord(studentId: '', date: date, status: 'حاضر'),
    );
    return record.status;
  }

  void addGrade(Grade grade) {
    grades.add(grade);
    notifyListeners();
  }

  double getStudentAverage(String studentId) {
    final studentGrades = grades.where((g) => g.studentId == studentId).toList();
    if (studentGrades.isEmpty) return 0;
    return studentGrades.map((g) => g.score).reduce((a, b) => a + b) / studentGrades.length;
  }

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void addHomework(Homework homework) {
    homeworks.add(homework);
    notifyListeners();
  }

  void toggleHomework(String id) {
    final index = homeworks.indexWhere((h) => h.id == id);
    if (index != -1) {
      homeworks[index] = Homework(
        id: homeworks[index].id,
        title: homeworks[index].title,
        description: homeworks[index].description,
        dueDate: homeworks[index].dueDate,
        classId: homeworks[index].classId,
        isCompleted: !homeworks[index].isCompleted,
      );
      notifyListeners();
    }
  }
}