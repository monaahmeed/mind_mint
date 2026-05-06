import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGradient;

  const ResultButton({super.key, required this.text, required this.onPressed, required this.isGradient});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isGradient ? BorderSide.none : const BorderSide(color: Color(0xffE4B5B9)),
          ),
          backgroundColor: isGradient ? null : Colors.transparent,
          elevation: 0,
        ),
        child: Ink(
          decoration: isGradient ? BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xffE2AAAD), Color.fromARGB(255, 168, 125, 181)]),
            borderRadius: BorderRadius.circular(16),
          ) : null,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: isGradient ? Colors.white : const Color(0xffE4B5B9)),
            ),
          ),
        ),
      ),
    );
  }
}