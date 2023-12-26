import 'package:budgetbuddy/spent/controllers/spent_steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpentStepsWidget extends StatefulWidget {
  const SpentStepsWidget({super.key});

  @override
  State<SpentStepsWidget> createState() => _SpentStepsWidgetState();
}

class _SpentStepsWidgetState extends State<SpentStepsWidget> {
  final SpentStepsController spentStepsController = Get.put(SpentStepsController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Stepper(
          type: StepperType.horizontal,
          currentStep: spentStepsController.currentState.value,
          onStepContinue: spentStepsController.onContinue,
          onStepCancel: spentStepsController.onCancel,
          steps: [
            Step(
              isActive: spentStepsController.currentState.value >= 0,
              title: Text('Step 1'), 
              content: Text('Content for step 1')
            ),
            Step(
              isActive: spentStepsController.currentState.value >= 1,
              title: Text('Step 2'), 
              content: Text('Content for step 2')
            ),
            Step(
              isActive: spentStepsController.currentState.value >= 2,
              title: Text('Step 3'), 
              content: Text('Content for step 3')
            ),
          ]
        );
      })
    );
  }
}