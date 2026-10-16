import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('مدیریت تکالیف')),
      body: ListView.builder(
        itemCount: provider.homeworks.length,
        itemBuilder: (context, index) {
          final homework = provider.homeworks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Checkbox(
                value: homework.isCompleted,
                onChanged: (_) => provider.toggleHomework(homework.id),
                activeColor: primaryColor,
              ),
              title: Text(homework.title, style: TextStyle(decoration: homework.isCompleted ? TextDecoration.lineThrough : null)),
              subtitle: Text('مهلت: ${homework.dueDate.day}/${homework.dueDate.month} - ${homework.description}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('افزودن تکلیف در نسخه کامل')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}