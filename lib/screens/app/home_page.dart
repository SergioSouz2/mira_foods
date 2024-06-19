import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:mira_foods/widgets/header/header_widget.dart';
import 'package:mira_foods/widgets/search/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          const SearchWidget(),
          Expanded(
            child: FutureBuilder(
              future: authProvider.getDocuments('Category'), // Exemplo: obtenção da coleção 'category'
              builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar dados: ${snapshot.error}'));
                } else {
                  List<String> documents = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(documents[index]),
                        // Adicione mais detalhes conforme necessário
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
