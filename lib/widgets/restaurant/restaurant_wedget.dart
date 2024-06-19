import 'package:flutter/material.dart';
import 'package:mira_foods/models/restaurant_model.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:mira_foods/widgets/restaurant/restaurant_item.dart';
import 'package:provider/provider.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: authProvider.getDocuments('Restaurant'), // Ajuste para o nome correto da coleção
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar dados'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum restaurante encontrado'));
        }

        // Mapear os dados para objetos Restaurant
        List<Restaurant> restaurants = snapshot.data!.map((data) => Restaurant.fromMap(data)).toList();

        // Criar uma lista de widgets RestaurantItem com padding entre eles
        List<Widget> restaurantItems = restaurants.map((restaurant) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            child: RestaurantItem(
            image: restaurant.imageUrl,
            title: restaurant.name,
            deliveryFee: restaurant.deliveryFee,
            deliveryTimeMinutes: restaurant.deliveryTimeMinutes,
            onPressed: () {
              print('Restaurante clicado: ${restaurant.name}');
            },
            ),
          );
        }).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: restaurantItems,
          ),
        );
      },
    );
  }
}
