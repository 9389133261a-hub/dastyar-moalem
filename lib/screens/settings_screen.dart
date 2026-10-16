import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('تنظیمات')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(provider.isPremium ? Icons.star : Icons.star_border, color: primaryColor),
            title: Text(provider.isPremium ? 'نسخه پرمیوم فعال است' : 'ارتقا به نسخه پرمیوم'),
            subtitle: const Text('حذف تبلیغات + امکانات پیشرفته'),
            onTap: () => provider.togglePremium(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.backup),
            title: const Text('پشتیبان‌گیری'),
            subtitle: const Text('ذخیره داده‌ها روی گوشی'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('پشتیبان‌گیری در نسخه کامل پیاده‌سازی می‌شود')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('درباره اپ'),
            subtitle: const Text('دستیار معلم دبستان - نسخه اولیه'),
          ),
          if (!provider.isPremium)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('تبلیغات در نسخه رایگان نمایش داده می‌شود', style: TextStyle(color: textSecondary)),
            ),
        ],
      ),
    );
  }
}