/*
Generete a flutter widget to list my companies
Add a button to edit any item
Add a button to delete any item
Update my list when I add, edit or delete an item
Use my CompanyService
Use my CompanyCard
*/

import 'package:budgetbuddy/company/pages/widgets/company_card.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';
import 'package:budgetbuddy/company/services/company_service.dart';
import 'package:get/get.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;
    if (screenWidth < 800) {
      crossAxisCount = 1;
    } else if (screenWidth < 1200) {
      crossAxisCount = 2;
    } else { 
      crossAxisCount = 3;
    }

    return FutureBuilder<List<Company>>(
      future: companyService.getCompanies(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final companies = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 150),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 1
            ),
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              return CompanyCard(
                company: company, 
                onEdit: () => onEditCompany(context, company), 
                onDelete: () => onDeleteCompany(company),
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

  void onDeleteCompany(Company company) {
    companyService
      .deleteCompany(company.document)
      .whenComplete(() => setState(() {}));
  }

  void onEditCompany(BuildContext context, Company company) {
    Get.to(() => CompanyForm(company: company))?.whenComplete(() => setState(() {}));
  }
}
