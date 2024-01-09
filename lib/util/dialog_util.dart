import 'package:flutter/material.dart';

class DialogUtil {
  // Generic bottom sheet dialog with rounded border and top decoration
  void showGenericBottomSheetDialog(BuildContext context, List<Widget> widgets) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 10),
            // Top decoration in middle
            Center(
              child: Container(
                height: 5,
                width: 20,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.5), color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),

            // Main content
            for (Widget widget in widgets) widget
          ]);
        });
  }
}
