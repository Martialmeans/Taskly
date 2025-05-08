import 'package:flutter/material.dart';

Future<void> dialogBox(context, controller, save) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(0),
            ),
            hintText: "Enter your task...",
            hintStyle: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        actions: [
          MaterialButton(onPressed: () {
            final String text = controller.text.trim();
            if (text.isNotEmpty) {
              save(text);
              controller.clear();
              Navigator.pop(context);
            }
          }, child: const Text("Save")),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ],
        shape: Border(),
      );
    },
  );
}
