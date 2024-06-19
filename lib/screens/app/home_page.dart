import 'package:flutter/material.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:mira_foods/widgets/header/header_widget.dart';
import 'package:mira_foods/widgets/search/search_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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