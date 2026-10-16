import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/app_provider.dart';
import '../theme.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('دفتر تلفن')),
      body: ListView.builder(
        itemCount: provider.contacts.length,
        itemBuilder: (context, index) {
          final contact = provider.contacts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: primaryColor, child: Text(contact.name[0], style: const TextStyle(color: Colors.white))),
              title: Text(contact.name),
              subtitle: Text('${contact.relation} - ${contact.phone}'),
              trailing: IconButton(
                icon: const Icon(Icons.phone, color: primaryColor),
                onPressed: () => launchUrl(Uri.parse('tel:${contact.phone}')),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('افزودن مخاطب در نسخه کامل')));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}