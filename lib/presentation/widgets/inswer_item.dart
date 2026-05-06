import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  final String label;
  final String answerText;
  final bool isSelected;
  final VoidCallback onTap;
  
  
  final bool isCorrect;
  final bool isWrong;
  final bool showResult;

  const AnswerItem({
    super.key,
    required this.label,
    required this.answerText,
    required this.isSelected,
    required this.onTap,
    this.isCorrect = false, 
    this.isWrong = false,
    this.showResult = false,
  });

  @override
  Widget build(BuildContext context) {
    // تحديد الألوان بناءً على الحالة
    Color getBackgroundColor() {
      if (!showResult) return isSelected ? const Color(0xffF2E7F5) : const Color(0xffF2EAF9);
      if (isCorrect) return const Color(0xffE8F5E9); // أخضر فاتح جداً للصح
      if (isWrong) return const Color(0xffFFEBEE); // أحمر فاتح جداً للغلط
      return const Color(0xffF2EAF9);
    }

    Color getBorderColor() {
      if (!showResult) return isSelected ? const Color(0xffE1A8AE) : Colors.transparent;
      if (isCorrect) return Colors.green;
      if (isWrong) return Colors.red;
      return Colors.transparent;
    }

    return GestureDetector(
      onTap: showResult ? null : onTap, 
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: getBackgroundColor(),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: getBorderColor(), width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: getBorderColor() == Colors.transparent ? Colors.white : getBorderColor(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getBorderColor() == Colors.transparent ? Colors.grey[600] : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                answerText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff2C2633)),
              ),
            ),
            
            if (showResult && (isCorrect || isWrong))
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
              )
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? const Color(0xffE1A8AE) : const Color(0xffFEFCFF),
                    width: 2,
                  ),
                  color: isSelected ? const Color(0xffE1A8AE) : Colors.transparent,
                ),
                child: isSelected ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
              ),
          ],
        ),
      ),
    );
  }
}