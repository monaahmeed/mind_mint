import 'package:flutter/material.dart';

class CustomModeCard extends StatelessWidget {
  final String tag;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomModeCard({
    super.key,
    required this.tag,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 170,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xffFFFBFA) : Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(28),
            
            boxShadow: isSelected 
                ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
             
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F0F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF4A3656) : const Color(0xFF4A3656).withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}