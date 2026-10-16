import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adivery/adivery.dart';
import 'theme.dart';
import 'providers/app_provider.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/grades_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/homework_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // مقداردهی اولیه ادیوری
  AdiveryPlugin.initialize("d729152e-6f68-452a-8343-f6f3d2709cf9");
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const TeacherAssistantApp(),
    ),
  );
}

class TeacherAssistantApp extends StatelessWidget {
  const TeacherAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'دستیار معلم دبستان',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const MainNavigation(),
      locale: const Locale('fa', 'IR'),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ScheduleScreen(),
    AttendanceScreen(),
    GradesScreen(),
    ContactsScreen(),
    HomeworkScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: textSecondary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'برنامه'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'حضور'),
            BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'نمرات'),
            BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'تلفن'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'تکلیف'),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: 'تقویم'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'تنظیمات'),
          ],
        ),
      ),
    );
  }
}