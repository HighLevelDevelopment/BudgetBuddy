import 'package:budgetbuddy/spent/controllers/spent_controller.dart';
import 'package:budgetbuddy/spent/widgets/spent_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/my_theme.dart';

class SpentPage extends StatefulWidget {
  const SpentPage({super.key});

  @override
  State<SpentPage> createState() => _SpentPageState();
}

class _SpentPageState extends State<SpentPage> {
  final SpentController spentController = Get.put(SpentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spent', 
          style: TextStyle(color: MyTheme.lightColor, fontWeight: FontWeight.bold)
        ),
        backgroundColor: MyTheme.highlightColor,
        elevation: 0,
      ),
      body: const SpentTableWidget()
    );
  }
}