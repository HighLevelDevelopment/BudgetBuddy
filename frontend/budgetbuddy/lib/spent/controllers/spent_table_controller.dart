import 'package:budgetbuddy/spent/models/spent.dart';
import 'package:get/get.dart';

class SpentTableController extends GetxController {
  var spents = <Spent>[].obs;

  Future fetchData() async {
    spents.value = [
      Spent(
        idSpent: 1, 
        description: 'Netflix', 
        category: 'Entretenimento', 
        type: 'Mensal', 
        spentAmount: 22.30
      ),
      Spent(
        idSpent: 2, 
        description: 'Disney Plus e Star+', 
        category: 'Entretenimento', 
        type: 'Mensal', 
        spentAmount: 4.95
      ),
    ];
  }
}