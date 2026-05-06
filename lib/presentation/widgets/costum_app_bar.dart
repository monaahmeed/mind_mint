import 'package:flutter/material.dart';


class CostumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CostumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Text(
            'Mind Mint',
            style: TextStyle(
              color: Color(0xffF9919C),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),

        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      );
    
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
