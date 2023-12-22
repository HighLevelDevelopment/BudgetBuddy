import 'package:budgetbuddy/common/widget/dropzone/models/dropped_file.dart';
import 'package:flutter/material.dart';

class DroppedFileWidget extends StatefulWidget {
  final DroppedFile? file;

  const DroppedFileWidget({super.key, this.file});

  @override
  State<DroppedFileWidget> createState() => _DroppedFileWidgetState();
}

class _DroppedFileWidgetState extends State<DroppedFileWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(),
        const SizedBox(width: 10),
        if (widget.file != null && widget.file?.url != "") Column(
          children: [
            Text(widget.file?.name ?? '', style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(widget.file?.size ?? 0.toString()),
            Text(widget.file?.mime ?? '')
          ],
        ),
      ],
    );
  }

  Widget buildImage() {
    if (widget.file == null || widget.file?.url == "") {
      return buildEmptyFile('No file');
    }

    return Image.network(
      widget.file!.url, 
      width: 120, 
      height: 120,
      fit: BoxFit.cover,
      errorBuilder: (context, error, _) => buildEmptyFile('No Preview'),
    );
  }
  
  Widget buildEmptyFile(String text) {
    return Container(
      width: 120,
      height: 120,
      color: Colors.blue,
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}