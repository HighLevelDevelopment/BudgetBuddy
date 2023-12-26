import 'package:budgetbuddy/common/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/widgets/company_form.dart';
import 'package:budgetbuddy/company/widgets/company_list.dart';

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
        title: const Text(
          'Company', 
          style: TextStyle(color: MyTheme.lightColor, fontWeight: FontWeight.bold)
        ),
        backgroundColor: MyTheme.highlightColor,
        elevation: 0,
      ),
      body: const CompanyList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.highlightColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CompanyForm(),
            ),
          ).whenComplete(() => setState(() {}));
        },
        child: const Icon(Icons.add, color: MyTheme.lightColor),
      ),
      
    );
  }
}
