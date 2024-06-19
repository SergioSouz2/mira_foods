import 'package:flutter/material.dart';
import 'package:mira_foods/providers/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mira_foods/widgets/authentication_wrapper/authentication_wrapper.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Scaffold(
          body: AuthenticationWrapper(),
        ),
      ),
    );
  }
}



