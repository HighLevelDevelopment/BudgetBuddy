import 'package:budgetbuddy/common/navigation/controllers/subpages_controller.dart';
import 'package:budgetbuddy/common/navigation/widgets/company_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({super.key});

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  final SubPagesController subPagesController = Get.put(SubPagesController());

  @override
  Widget build(BuildContext context) {
    return const CompanyMenu();
  }
}