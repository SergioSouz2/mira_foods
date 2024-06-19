import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String image;
  final String title;
  final double deliveryFee;
  final dynamic deliveryTimeMinutes; // Pode ser String ou int
  final VoidCallback onPressed;

  const RestaurantItem({
    super.key,
    required this.image,
    required this.title,
    required this.deliveryFee,
    required this.deliveryTimeMinutes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image, height: 136, width: 266, fit: BoxFit.fill),
              ),
              Text(
                title,  
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Poppins'
                ),
              ),
              const SizedBox(height: 4), // Espaço entre os textos
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.delivery_dining ,  color: Colors.red, size: 20,),
                        const SizedBox(width: 4),
                        Text(deliveryFee == 0 
                          ? 'Entrega Grátis'  
                          : 'Entrega: R\$ ${deliveryFee.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      ],
                    ),
                       const SizedBox(width: 10), // Espaço entre os textos
                    Row(
                      children: [
                        const Icon(Icons.timer , color: Colors.red, size: 20,),
                        const SizedBox(width: 4),
                        Text(
                          '$deliveryTimeMinutes min',
                           style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              
            ],
          ),
      ),
     
    );
  }
}
