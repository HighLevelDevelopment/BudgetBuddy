/*
Generete a flutter widget to list my companies
Add a button to edit any item
Add a button to delete any item
Update my list when I add, edit or delete an item
Use my CompanyService
Use my CompanyCard
*/

import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';
import 'package:budgetbuddy/company/services/company_service.dart';

import 'company_form.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final companyService = CompanyService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Company>>(
      future: companyService.getCompanies(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final companies = snapshot.data!;
          return ListView.builder(
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              return ListTile(
                title: Text(company.name),
                subtitle: Text(company.trading),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final updatedCompany = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyForm(company: company),
                          ),
                        );
                        if (updatedCompany != null) {
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        await companyService.deleteCompany(company.document).then((value) => setState(() {}));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('An error occurred'),
          );
        } else {
          return const Center(
            child: Text('No companies found'),
          );
        }
      },
    );
  }
}
