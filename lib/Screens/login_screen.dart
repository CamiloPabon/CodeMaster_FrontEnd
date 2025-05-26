import 'package:flutter/material.dart';
import 'package:hola_mundo/Screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //! Logo de la aplicación
                Image.asset(
                  'assets/images/iconLight.png',
                  height: 100,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                
                //! Título
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
                
                //! Subtítulo "CREAR UNA CUENTA"
                const Text(
                  'Ingresar a CodeMaster',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                
                //! Instrucción "INTRODUCE TU EMAIL PARA REGISTRARTE"
                const Text(
                  'Introduce tus datos para entrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                
                //! Campo de email
                TextField(
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
                ),
                const SizedBox(height: 20),

                //! Campo de contraseña 
                TextField(
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
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30),
                
                //! Botón Continuar
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el registro
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    //* Lógica de autenticación
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                //! Texto con hipervínculo
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de login
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: const Text(
                    '¿Aun no tienes una cuenta? Ingresa aquí para registrarte',
                    textAlign: TextAlign.center,
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
    );
  }
}