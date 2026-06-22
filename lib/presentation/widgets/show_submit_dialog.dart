import 'package:flutter/material.dart';
import 'package:mind_mint/data/model/level_model.dart';
import 'package:mind_mint/presentation/widgets/costum_app_bar.dart';
import 'package:mind_mint/presentation/widgets/result_view_body.dart';

void showSubmitDialog({
  required BuildContext context,
  LevelModel? levelModel,
  String? categoryName,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Finish Quiz?"),
        content: const Text("Are you sure you want to submit your answers?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6D5458),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
           
           
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: const CostumAppBar(),
                    body: ResultViewBody(
                      levelModel: levelModel,
                      categoryName: categoryName,
                    ),
                  ),
                ),
              );
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
