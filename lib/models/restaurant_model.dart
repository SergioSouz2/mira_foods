// models/restaurant.dart

class Restaurant {
  final String imageUrl;
  final String name;
  final double deliveryFee;
  final int deliveryTimeMinutes;

  Restaurant({
    required this.imageUrl,
    required this.name,
    required this.deliveryFee,
    required this.deliveryTimeMinutes,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      imageUrl: map['imageUrl'] ?? 'https://exemplo.com/imagens/default.jpg',
      name: map['name'] ?? 'Sem Título',
      deliveryFee: map['deliveryFee'] != null ? map['deliveryFee'].toDouble() : 0.0,
      deliveryTimeMinutes: map['deliveryTimeMinutes'] ?? 0,
    );
  }
}
