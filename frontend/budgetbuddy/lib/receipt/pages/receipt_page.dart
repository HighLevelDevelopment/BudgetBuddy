import 'package:budgetbuddy/common/widget/dropzone/dropped_file_widget.dart';
import 'package:budgetbuddy/common/widget/dropzone/dropzone_widget.dart';
import 'package:budgetbuddy/receipt/controllers/receipt_dropzone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final ReceiptDropzoneController receiptDropzoneController = Get.put(ReceiptDropzoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => DroppedFileWidget(file: receiptDropzoneController.selectedFile.value)),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: Center(
                child: DropzoneWidget(onDroppedFile: receiptDropzoneController.changeFile,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}