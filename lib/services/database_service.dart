import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollection(String collectionName) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Erro ao acessar coleção $collectionName: $e');
      throw Exception('Erro ao acessar coleção $collectionName: $e');
    }
  }

  // Adicione mais métodos conforme necessário, como adicionar, atualizar, deletar documentos, etc.
}
