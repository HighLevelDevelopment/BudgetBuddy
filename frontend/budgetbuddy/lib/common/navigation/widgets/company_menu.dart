import 'package:budgetbuddy/about/pages/about_page.dart';
import 'package:budgetbuddy/company/pages/company_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/subpages_controller.dart';

class CompanyMenu extends StatefulWidget {
  const CompanyMenu({super.key});

  @override
  State<CompanyMenu> createState() => _CompanyMenuState();
}

class _CompanyMenuState extends State<CompanyMenu> {
  final SubPagesController subPagesController = Get.put(SubPagesController());
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Item 1'),
                onTap: () => subPagesController.changeIndex(0),
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () => subPagesController.changeIndex(1),
              ),
            ]
          ),
        ),
        Expanded(child: Obx(() {
            switch (subPagesController.selectedIndex.value) {
              case 1:
                return const AboutPage();
          
              default:
                return const CompanyPage();
            }
          })),
      ],
    );
  }
}