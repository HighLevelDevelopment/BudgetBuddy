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
    } else if (screenWidth < 1000) {
      crossAxisCount = 2;
    } else { 
      crossAxisCount = 4;
    }

    return FutureBuilder<List<Company>>(
      future: companyService.getCompanies(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final companies = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Number of columns
              crossAxisSpacing: 10, // Horizontal space between cards
              mainAxisSpacing: 10, // Vertical space between cards
              childAspectRatio: 3 / 1, // Aspect ratio of the cards
            ),
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              return CompanyCard(company: company, onEdit: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyForm(company: company),
                  ),
                );

                setState(() {});
               }, onDelete: () {
                companyService.deleteCompany(company.document);
                setState(() {});
               },);
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
