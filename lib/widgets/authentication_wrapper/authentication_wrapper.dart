import 'package:flutter/material.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:mira_foods/screens/app/home_page.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Se o usuário ainda não estiver autenticado, você pode exibir uma tela de carregamento
    if (authProvider.user == null) {
      return const Scaffold(
        body: Center(
          child:  CircularProgressIndicator(),
        ),
      );
    }

    // Se estiver autenticado, vá para a página principal do aplicativo
    return const HomePage();
  }
}