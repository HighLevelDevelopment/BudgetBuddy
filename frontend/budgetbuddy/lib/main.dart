import 'package:budgetbuddy/common/my_theme.dart';
import 'package:budgetbuddy/company/pages/widgets/company_list.dart';
import 'package:budgetbuddy/company/pages/company_page.dart';
import 'package:budgetbuddy/dashboard/pages/dashboard_page.dart';
import 'package:budgetbuddy/home.dart';
import 'package:budgetbuddy/navigation/pages/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy/company/models/company.dart';
import 'package:budgetbuddy/company/services/company_service.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Budget Buddy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: MyTheme.lightTheme,
      routes: {
        '/': (context) => const NavigationPage(),
      },
    );
  }
}

