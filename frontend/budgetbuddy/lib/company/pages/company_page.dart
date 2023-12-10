import 'package:budgetbuddy/company/services/company_service.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final service = CompanyService();

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () async => {
      await service.fetchData()
    }, child: const Text("Test"));
  }
}