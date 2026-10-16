import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final days = ['شنبه', 'یکشنبه', 'دوشنبه', 'سه‌شنبه', 'چهارشنبه'];

    return Scaffold(
      appBar: AppBar(title: const Text('برنامه کلاسی')),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final daySchedules = provider.schedules.where((s) => s.day == day).toList();
          return ExpansionTile(
            title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
            children: daySchedules.isEmpty
                ? [const ListTile(title: Text('برنامه‌ای ثبت نشده'))]
                : daySchedules.map((s) => ListTile(
                      leading: const Icon(Icons.access_time, color: primaryColor),
                      title: Text(s.subject),
                      subtitle: Text('${s.startTime} تا ${s.endTime}'),
                    )).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add schedule dialog
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('افزودن برنامه در نسخه کامل')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}