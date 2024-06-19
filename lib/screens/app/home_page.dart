import 'package:flutter/material.dart';
import 'package:mira_foods/widgets/header/header_widget.dart';
import 'package:mira_foods/widgets/search/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          SearchWidget()
        ],
      ),
    );
  }
}