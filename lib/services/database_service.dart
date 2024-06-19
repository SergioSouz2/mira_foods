import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getCollection(String collectionName) async {
    try {
      QuerySnapshot<Object?> querySnapshot = await _firestore.collection(collectionName).get();
      List<String> items = [];
      querySnapshot.docs.forEach((doc) {
        // Aqui você pode adaptar conforme a estrutura do seu documento
        // Por exemplo, doc.data()['name'] para acessar um campo 'name'
        items.add(doc.data().toString()); // Exemplo básico, convertendo para String
      });
      return items;
    } catch (e) {
      print('Erro ao acessar coleção $collectionName: $e');
      throw Exception('Erro ao acessar coleção $collectionName: $e');
    }
  }

  // Adicione mais métodos conforme necessário, como adicionar, atualizar, deletar documentos, etc.
}
