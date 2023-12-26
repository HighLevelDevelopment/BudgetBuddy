import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';
import 'package:budgetbuddy/company/services/company_service.dart';
import 'package:get/get.dart';

import '../../common/my_theme.dart';

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
    ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: MyTheme.highlightColor, // Background color
      foregroundColor: Colors.white, // Text color
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5, // Shadow depth
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Company Form', 
          style: TextStyle(color: MyTheme.lightColor, fontWeight: FontWeight.bold)
        ),
        backgroundColor: MyTheme.highlightColor,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder( // Used when field is enabled, but not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                  enabledBorder: OutlineInputBorder( // Used when field is enabled and not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _tradingController,
                decoration: const InputDecoration(
                  labelText: 'Trading',
                  border: OutlineInputBorder( // Used when field is enabled, but not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                  enabledBorder: OutlineInputBorder( // Used when field is enabled and not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a trading';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _documentController,
                decoration: const InputDecoration(
                  labelText: 'Document',
                  border: OutlineInputBorder( // Used when field is enabled, but not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                  enabledBorder: OutlineInputBorder( // Used when field is enabled and not focused
                    borderSide: BorderSide(color: MyTheme.highlightColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a document';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final company = Company(
                      id: widget.company?.id ?? 0,
                      name: _nameController.text,
                      trading: _tradingController.text,
                      document: _documentController.text,
                    );
              
                    _companyService.createOrUpdateCompany(company).then((value) => 
                      Get.back());
                  }
                },
                style: saveButtonStyle,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}