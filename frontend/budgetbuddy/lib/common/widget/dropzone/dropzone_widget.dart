import 'package:budgetbuddy/common/widget/dropzone/models/dropped_file.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropzoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropzoneWidget({super.key, required this.onDroppedFile});

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
  
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    final colorButton = isHighlighted ? Colors.blue.shade300 : Colors.green.shade300;

    return buildDecoration(child: Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onHover: () => setState(() => isHighlighted = true),
          onLeave: () => setState(() => isHighlighted = false),
          onDrop: acceptFile,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_upload, size: 80, color: Colors.white,),
              const Text("Drop files here", style: TextStyle(color: Colors.white, fontSize: 20),),
              const SizedBox(height: 16,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: colorButton, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20), shape: const RoundedRectangleBorder()),
                icon: const Icon(Icons.search, size: 32, color: Colors.white,),
                label: const Text("Choose File", style: TextStyle(fontSize: 20, color: Colors.white),),
                onPressed: () async {
                  final events = await controller.pickFiles();
                  if (events.isEmpty) return;
                  acceptFile(events.first);
                },
              ),
              const SizedBox(height: 10,),
              const Text("Max file size 1GB.", style: TextStyle(color: Colors.white, fontSize: 14),),
            ]
          ),
        ),
      ]
    ));
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = isHighlighted ? Colors.blue : Colors.green;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: colorBackground,
        padding: const EdgeInsets.all(10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [10, 10],
          color: Colors.white,
          strokeWidth: 2,
          child: child),
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);


    debugPrint("name: $name");
    debugPrint("mime: $mime");
    debugPrint("bytes: $bytes");
    debugPrint("url: $url");

    final droppedFile = DroppedFile(name: name, mime: mime, bytes: bytes, url: url);

    widget.onDroppedFile(droppedFile);
    setState(() {
      isHighlighted = false;
    });
  }
}