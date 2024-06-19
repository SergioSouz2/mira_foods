import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;

  const CategoryItem({
    super.key, // Adiciona a chave key corretamente
    required this.image,
    required this.title,
    required this.onPressed,
  }); // Chama o construtor da classe pai com a chave key

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 3,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho do Row ao conteúdo
          children: [
            Image.network(image, width: 36, height: 36),
            const SizedBox(width: 8), // Espaço entre a imagem e o texto
            Text(title, style: const TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
