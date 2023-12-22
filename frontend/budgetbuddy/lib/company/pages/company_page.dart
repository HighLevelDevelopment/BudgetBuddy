import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/pages/widgets/company_form.dart';
import 'package:budgetbuddy/company/pages/widgets/company_list.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: CompanyList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CompanyForm(),
            ),
          ).whenComplete(() => setState(() {}));
        },
      ),
    );
  }
}
