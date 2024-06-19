import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mira_foods/services/database_service.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _dbService = DatabaseService();
  User? _user;

  AuthProvider() {
    _init();
  }

  void _init() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print('Erro ao fazer login anônimo automaticamente: $e');
      throw Exception('Erro ao fazer login anônimo automaticamente: $e');
    }

    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  Future<List<Map<String, dynamic>>> getDocuments(String collectionName) async {
    return _dbService.getCollection(collectionName);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
