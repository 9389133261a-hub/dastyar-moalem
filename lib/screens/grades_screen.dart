import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ثبت نمرات')),
      body: ListView.builder(
        itemCount: provider.students.length,
        itemBuilder: (context, index) {
          final student = provider.students[index];
          final average = provider.getStudentAverage(student.id);
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: primaryColor, child: Text(student.name[0], style: const TextStyle(color: Colors.white))),
              title: Text(student.name),
              subtitle: Text('میانگین: ${average.toStringAsFixed(1)}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_circle, color: primaryColor),
                onPressed: () => _showAddGradeDialog(context, student.id),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddGradeDialog(BuildContext context, String studentId) {
    final scoreController = TextEditingController();
    final subjectController = TextEditingController(text: 'ریاضی');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ثبت نمره جدید'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: subjectController, decoration: const InputDecoration(labelText: 'درس')),
            TextField(controller: scoreController, decoration: const InputDecoration(labelText: 'نمره'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('انصراف')),
          ElevatedButton(
            onPressed: () {
              final score = double.tryParse(scoreController.text) ?? 0;
              Provider.of<AppProvider>(context, listen: false).addGrade(
                Grade(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  studentId: studentId,
                  subject: subjectController.text,
                  score: score,
                  date: DateTime.now(),
                  type: 'کلاسی',
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('ثبت'),
          ),
        ],
      ),
    );
  }
}