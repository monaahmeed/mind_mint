

import 'package:flutter/material.dart';

class SThemeProgressCircle extends StatelessWidget {
  final double percentage;
  const SThemeProgressCircle({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: CircularProgressIndicator(
            value: percentage,
            strokeWidth: 12,
            backgroundColor: const Color(0xffF2E7F5),
            color: const Color(0xffE4B5B9),
          ),
        ),
        Column(
          children: [
            Text(
              "${(percentage * 100).toInt()}%",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xff6D5458)),
            ),
            const Text("SCORE", style: TextStyle(fontSize: 14, letterSpacing: 2, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}