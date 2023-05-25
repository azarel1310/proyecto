import 'package:flutter/material.dart';
import 'package:proyecto/registro.dart';
import 'package:proyecto/user.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Realizar la validación de inicio de sesión
    bool isLoggedIn = await User.login(username, password);

    if (isLoggedIn) {
      // Inicio de sesión exitoso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(user: User())),
      );
    } else {
      // Inicio de sesión fallido
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Inicio de sesión fallido'),
            content:
                Text('El nombre de usuario o la contraseña son incorrectos.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100.0,
              backgroundImage: const AssetImage(
                  'assets/PP_IMMUJER.png'), // Ruta de la imagen
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Iniciar sesión'),
              onPressed: _login,
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                '¿No tienes una cuenta? Regístrate',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
