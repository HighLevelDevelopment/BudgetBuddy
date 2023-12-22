import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: isExpanded,
            backgroundColor: Colors.deepPurple.shade400,
            unselectedIconTheme: const IconThemeData(color: Colors.white, opacity: 1),
            unselectedLabelTextStyle: const TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Colors.deepPurple.shade900, opacity: 1),
            // selectedLabelTextStyle: const TextStyle(color: Colors.white),
            destinations: [
            NavigationRailDestination(
              icon: const Icon(Icons.home),
              label: const Text('Home'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.bar_chart),
              label: const Text('Repports'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.person),
              label: const Text('Profile'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
            ),
          ], selectedIndex: 0),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(child: Text('Dashboard'))
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}