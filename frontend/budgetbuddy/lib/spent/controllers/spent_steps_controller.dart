import 'package:get/get.dart';

class SpentStepsController extends GetxController {
  var currentState = 0.obs;
  final int stepsQuantity = 3;

  void changeState(int state) {
    if (state >= 0 && state < stepsQuantity) {
      currentState.value = state;
    }
  }

  void onContinue() => changeState(currentState.value +1);
  void onCancel() => changeState(currentState.value -1);
}