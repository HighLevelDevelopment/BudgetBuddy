import 'package:budgetbuddy/common/widget/dropzone/models/dropped_file.dart';
import 'package:get/get.dart';

class ReceiptDropzoneController extends GetxController {
  var selectedFile = DroppedFile.empty().obs;

  void changeFile(DroppedFile file) {
    selectedFile.value = file;
  }
}