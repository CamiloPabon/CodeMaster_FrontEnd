import 'package:flutter/material.dart';
import 'package:hola_mundo/Screens/actividades_Screen.dart';
import 'package:hola_mundo/Screens/login_screen.dart';
import 'package:hola_mundo/Screens/register_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/Ranking_screen.dart';
//import 'Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(), // Página principal con navbar
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Lista de pantallas para mostrar según el índice del BottomNavigationBar
  final List<Widget> _screens = const [
    HomeScreen(),
    ActivitiesScreen(), // Cambia a LoginScreen para la pantalla de actividades
    RankingScreen(), // Vista nueva del ranking
    RegisterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _screens[_currentIndex], // Muestra la pantalla según el índice actual
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
