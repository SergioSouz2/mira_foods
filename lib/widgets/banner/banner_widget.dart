import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  const BannerWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Image.asset(image),
    );
    
  }
}



 
