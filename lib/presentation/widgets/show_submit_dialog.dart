import 'package:flutter/material.dart';
import 'package:mind_mint/constants.dart';

void showSubmitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Finish Quiz?"),
        content: const Text("Are you sure you want to submit your answers?"),
        actions: [
          // زرار التراجع
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          // زرار التأكيد
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6D5458),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);

              Navigator.pushReplacementNamed(context, resultScreen);
            },
            child: const Text(
              "Yes, Submit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
