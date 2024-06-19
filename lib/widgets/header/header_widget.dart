import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only( left: 20, right: 20, top: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Mira Foods', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins',
                color: Colors.red
              ),
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.grey[600],
              onPressed: () {},
            ),
          ],
        ),
    );
    
  }
}