import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text('حضور و غیاب')),
      body: ListView.builder(
        itemCount: provider.students.length,
        itemBuilder: (context, index) {
          final student = provider.students[index];
          final status = provider.getAttendanceStatus(student.id, today);
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryColor,
                child: Text(student.name[0], style: const TextStyle(color: Colors.white)),
              ),
              title: Text(student.name),
              subtitle: Text('وضعیت امروز: $status'),
              trailing: DropdownButton<String>(
                value: status,
                items: ['حاضر', 'غایب', 'تأخیر'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (value) {
                  if (value != null) {
                    provider.updateAttendance(student.id, today, value);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}