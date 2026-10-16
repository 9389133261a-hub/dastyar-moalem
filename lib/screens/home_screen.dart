import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adivery/adivery.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final todaySchedules = provider.schedules.where((s) => s.day == _getTodayPersian()).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('دستیار معلم دبستان')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: primaryColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('برنامه امروز', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                    const SizedBox(height: 8),
                    if (todaySchedules.isEmpty)
                      const Text('امروز برنامه‌ای ندارید')
                    else
                      ...todaySchedules.map((s) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text('${s.startTime} - ${s.endTime}: ${s.subject}'),
                          )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('دسترسی سریع', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _QuickCard(icon: Icons.people, title: 'حضور و غیاب', color: Colors.blue),
                  _QuickCard(icon: Icons.grade, title: 'ثبت نمره', color: Colors.orange),
                  _QuickCard(icon: Icons.contacts, title: 'دفتر تلفن', color: Colors.green),
                  _QuickCard(icon: Icons.assignment, title: 'تکالیف', color: Colors.purple),
                ],
              ),
            ),
            if (!provider.isPremium)
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey[300],
                child: const Center(child: Text('بنر تبلیغاتی')),
              ),
          ],
        ),
      ),
    );
  }

  String _getTodayPersian() {
    final days = ['یکشنبه', 'دوشنبه', 'سه‌شنبه', 'چهارشنبه', 'پنج‌شنبه', 'جمعه', 'شنبه'];
    return days[DateTime.now().weekday % 7];
  }
}

class _QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _QuickCard({required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}