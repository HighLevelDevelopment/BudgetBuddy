// Generete a card for a company
// Use a light blue background
// Use component card
// Use a company model

import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';

class CompanyCard extends StatelessWidget {
  final Company company;

  const CompanyCard({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              company.name,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              company.trading,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}