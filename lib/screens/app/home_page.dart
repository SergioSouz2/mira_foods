import 'package:flutter/material.dart';
import 'package:mira_foods/widgets/category/category_wedget.dart';
import 'package:mira_foods/widgets/header/header_widget.dart';
import 'package:mira_foods/widgets/search/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView( // Adiciona SingleChildScrollView aqui
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(),
            SearchWidget(),
            CategoriesWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pedidos Recomendados', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  Text(
                    'Ver todos', 
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.red,
                    )
                  )
                ],
              ),
            ),
          SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Restaurantes Recomendados', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  Text(
                    'Ver todos', 
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.red,
                    )
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
