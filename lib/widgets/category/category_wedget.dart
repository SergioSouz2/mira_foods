import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:mira_foods/widgets/category/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: authProvider.getDocuments('Category'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar dados'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhuma categoria encontrada'));
        }

        List<Widget> categoryItems = snapshot.data!.map((data) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: CategoryItem(
              image: data['imageUrl'] ?? 'https://exemplo.com/imagens/default.jpg',
              title: data['name'] ?? 'Sem Título',
              onPressed: () {
                print('Categoria clicada');
              },
            ),
          );
        }).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categoryItems,
          ),
        );
      },
    );
  }
}
