import 'package:budgetbuddy/about/pages/about_page.dart';
import 'package:budgetbuddy/common/my_theme.dart';
import 'package:budgetbuddy/receipt/pages/receipt_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../company/pages/company_page.dart';
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
              backgroundColor: MyTheme.highlightColor,
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedLabelTextStyle: const TextStyle(color: Colors.white),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              selectedLabelTextStyle: const TextStyle(color: Colors.white),
              elevation: 4,
              indicatorColor: MyTheme.darkColor,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: InkWell(
                  child: Image.asset(
                    'assets/images/logo_without_bg.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              selectedIndex: navigationController.selectedIndex.value,
              onDestinationSelected: navigationController.changeIndex,
              labelType: NavigationRailLabelType.all,
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
                case 0:
                  return const CompanyPage();
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