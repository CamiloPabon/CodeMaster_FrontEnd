import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hola_mundo/Screens/home_screen.dart';
import 'package:hola_mundo/Screens/login_screen.dart';
import 'package:hola_mundo/Services/auth_service.dart';
import 'package:hola_mundo/Screens/Ranking_screen.dart';
import 'package:hola_mundo/Screens/Ranking_screen.dart';
import 'package:hola_mundo/Services/globals.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _createAccount() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await AuthServices.register(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      final responseMap = jsonDecode(response.body);
      
      if (response.statusCode == 200) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        if (!mounted) return;
        errorSnackBar(
          context,
          responseMap['message'] ?? responseMap.values.first[0],
        );
      }
    } catch (e) {
      if (!mounted) return;
      errorSnackBar(context, 'Error de conexión: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo de la aplicación
                  Image.asset(
                    'assets/images/iconLight.png',
                    height: 100,
                    width: 100,
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.error, size: 100),
                  ),
                  const SizedBox(height: 20),
                  
                  // Título
                  const Text(
                    'CODEA. COMPITE. GANA.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Subtítulo "CREAR UNA CUENTA"
                  const Text(
                    'Crea tu cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Instrucción
                  const Text(
                    'Introduce tus datos para registrarte',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Campo de nombre
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Campo de email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Introduce tu email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Ingresa un email válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo de contraseña
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  
                  // Botón Continuar
                  // Botón Continuar CORREGIDO
ElevatedButton(
  onPressed: _isLoading ? null : _createAccount,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
  ),
  child: _isLoading
      ? const CircularProgressIndicator(color: Colors.white)
      : const Text(
          'Continuar',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
),

// Enlace a login CORREGIDO
const SizedBox(height: 20),
TextButton(
  onPressed: _isLoading
      ? null
      : () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>LoginScreen(),
            ),
          ),
  child: const Text(
    '¿Ya tienes una cuenta? Ingresa aquí',
    style: TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 41, 41, 41),
      decoration: TextDecoration.underline,
    ),
                   ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}