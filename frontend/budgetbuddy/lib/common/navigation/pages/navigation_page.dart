import 'package:budgetbuddy/about/pages/about_page.dart';
import 'package:budgetbuddy/company/pages/widgets/company_list.dart';
import 'package:budgetbuddy/company/pages/company_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../receipt/pages/receipt_page.dart';
import '../controllers/navigation_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    navigationController.changeIndex(0);

    return Scaffold(
      body: Row(
        children: [
          Obx(() => 
            NavigationRail(
              extended: navigationController.isExtended.value,
              selectedIndex: navigationController.selectedIndex.value,
              onDestinationSelected: navigationController.changeIndex,
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.work),
                  label: Text('Company'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.receipt),
                  label: Text('Receipt'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info),
                  label: Text('About'),
                ),
              ],
            )
          ),
          Expanded(
            child: Obx(() {
              switch (navigationController.selectedIndex.value) {
                case 1:
                  return const ReceiptPage();
                case 2:
                  return const AboutPage();
                
                default:
                  return const CompanyPage();
              }
            }),
          )
        ],
      ),
    );
  }
}