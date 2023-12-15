/*
Generate a flutter page with the name "CompanyForm" 
This widget can create and edit a company
*/

import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';
import 'package:budgetbuddy/company/services/company_service.dart';

class CompanyForm extends StatefulWidget {
  final Company? company;

  const CompanyForm({super.key, this.company});

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _tradingController = TextEditingController();
  final _documentController = TextEditingController();

  final CompanyService _companyService = CompanyService();

  @override
  void initState() {
    super.initState();
    if (widget.company != null) {
      _nameController.text = widget.company!.name;
      _tradingController.text = widget.company!.trading;
      _documentController.text = widget.company!.document;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tradingController,
                decoration: const InputDecoration(
                  labelText: 'Trading',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a trading';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _documentController,
                decoration: const InputDecoration(
                  labelText: 'Document',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a document';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final company = Company(
                      id: widget.company?.id ?? 0,
                      name: _nameController.text,
                      trading: _tradingController.text,
                      document: _documentController.text,
                    );
                    final updatedCompany = await _companyService.createOrUpdateCompany(company);
                    Navigator.pop(context, updatedCompany);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}