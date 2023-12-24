import 'package:budgetbuddy/about/pages/about_page.dart';
import 'package:budgetbuddy/common/navigation/pages/navigation_drawer_page.dart';
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
              //labelType: NavigationRailLabelType.selected,
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
              trailing: Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon:
                        navigationController.isExtended.value ?
                        const Icon(Icons.keyboard_double_arrow_left) :
                        const Icon(Icons.keyboard_double_arrow_right),
                      onPressed: () {
                        navigationController.changeExtended();
                      },
                    ),
                  ),
                ),
              ),
            )
          ),
          const Expanded(
            child: NavigationDrawerPage(),
          )
        ],
      ),
    );
  }
}