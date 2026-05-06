import 'package:flutter/material.dart';
import 'package:mind_mint/data/model/category_model.dart';

class CustomCategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  const CustomCategoryCard({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffF9919C).withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.imagePath, height: 50),
            const SizedBox(height: 12),
            Text(
              category.displayName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff8C6A6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
