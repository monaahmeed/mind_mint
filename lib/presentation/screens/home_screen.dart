import 'package:flutter/material.dart';
import 'package:mind_mint/constants.dart';
import 'package:mind_mint/data/categories_data.dart';

import 'package:mind_mint/presentation/widgets/costum_app_bar.dart';
import 'package:mind_mint/presentation/widgets/custom_category_card.dart';
import 'package:mind_mint/presentation/widgets/mode_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMode = 'free';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 247, 243, 1),
      appBar: const CostumAppBar(),

      body: Padding(
        padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                CustomModeCard(
                  tag: 'Quick Start',
                  title: 'Free Play',
                  isSelected: selectedMode == 'free',
                  onTap: () {
                    setState(() {
                      selectedMode = 'free';
                    });
                  },
                ),
                const SizedBox(width: 16),
                CustomModeCard(
                  tag: 'Challenge',
                  title: 'Journey\nMode',
                  isSelected: selectedMode == 'challenge',
                  onTap: () {
                    setState(() {
                      selectedMode = 'challenge';
                    });
                  },
                ),
              ],
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
                      if (selectedMode == 'free') {
                        Navigator.pushNamed(
                          context,
                          questionsDetailsScreen,
                          arguments: categories[index],
                        );
                      } else {
                        Navigator.pushNamed(
                          context,
                          challengeLevelsScreen,
                          arguments: categories[index],
                        );
                      }
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
