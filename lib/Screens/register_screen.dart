import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            
            //! Título"
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
              'Crea tu cuenta',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            
            //! Instrucción "INTRODUCE TU EMAIL PARA REGISTRARTE"
            const Text(
              'Introduce tus datos para registrarte',
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
            
            //! Campo de nombre
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nombre',
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
            
            //! Botón Continue
            ElevatedButton(
              onPressed: () {
                // Lógica para el registro

                final email = _emailController.text;
                final password = _passwordController.text;
                final name = _nameController.text;
                // Aquí iría tu lógica de autenticación
                
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
          ],
        ),
      ),
    );
  }
}