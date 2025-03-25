import 'package:flutter/material.dart';
import 'screens/cadastro_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(FluxoLivreApp());
}

class FluxoLivreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluxo Livre',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/cadastro',
      routes: {
        '/cadastro': (context) => CadastroScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
