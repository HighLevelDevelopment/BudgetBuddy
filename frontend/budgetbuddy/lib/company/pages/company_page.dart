/*
Generate a flutter page with the name "CompanyPage" 
Put my list CompanyList and a floating button to add a new company using CompanyForm
And editing any item using CompanyForm
Update when go back grom CompanyForm
*/

import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/pages/widgets/company_card.dart';
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
        onPressed: () async {
          final updatedCompany = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CompanyForm(),
            ),
          );
          if (updatedCompany != null) {
            setState(() {});
          }
        },
      ),
    );
  }
}
