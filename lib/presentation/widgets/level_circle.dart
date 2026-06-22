import 'package:flutter/material.dart';

class LevelCircleWidget extends StatelessWidget {
  final int level;
  final bool isCompleted;
  final bool isActive;
  final VoidCallback? onTap;

  const LevelCircleWidget({
    super.key,
    required this.level,
    required this.isCompleted,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    Color backgroundColor;
    Widget centerWidget;
    List<BoxShadow> shadow = [];

    if (isCompleted) {
      
      backgroundColor = const Color(0xFF8B5A5A);
      centerWidget = const Icon(Icons.check, color: Colors.white, size: 28);
    } else if (isActive) {
      
      backgroundColor = const Color(0xffF9919C); 
      centerWidget = Text(
        "$level",
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
      shadow = [
        BoxShadow(
          color: const Color(0xffF9919C).withOpacity(0.3),
          blurRadius: 16,
          spreadRadius: 2,
          offset: const Offset(0, 6),
        ),
      ];
    } else {
      
      backgroundColor = Colors.white;
      centerWidget = Text(
        "$level",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade400,
        ),
      );
    }

    return GestureDetector(
      onTap: isActive ? onTap : null, 
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: shadow.isNotEmpty
              ? shadow
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
          border: Border.all(
            color: isActive ? const Color(0xFFFCF7F3) : Colors.white,
            width: 4,
          ),
        ),
        child: Center(child: centerWidget),
      ),
    );
  }
}
