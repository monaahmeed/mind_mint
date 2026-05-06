import 'package:flutter/material.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/categories_data.dart';
import 'package:mind_mint/presentation/widgets/costum_app_bar.dart';
import 'package:mind_mint/presentation/widgets/custom_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CostumAppBar(),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.9),
                    const Color(0xffFAF2F0),
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome back,",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8C6A6B),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Text(
                    "mona",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8C6A6B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ready to nurture your mind today?",
                    style: TextStyle(fontSize: 16, color: Color(0xff514746)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Explore Category",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 74, 44, 45),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                    color: Color.fromARGB(255, 74, 44, 45),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return CustomCategoryCard(
                    category: categories[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        questionsDetailsScreen, 
                        arguments:
                            categories[index], 
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
