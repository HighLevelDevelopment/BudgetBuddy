import 'package:budgetbuddy/common/my_theme.dart';
import 'package:budgetbuddy/common/navigation/pages/navigation_page.dart';
import 'package:flutter/material.dart';
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

