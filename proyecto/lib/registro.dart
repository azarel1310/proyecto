import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _register() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Lógica para registrar al usuario
    User.register(username, password);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro exitoso'),
          content: Text('Usuario registrado correctamente.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              child: Text('Registrarse'),
              onPressed: _register,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Bienvenido! Has iniciado sesión exitosamente.'),
      ),
    );
  }
}

class User {
  final String username;
  final String password;

  User(this.username, this.password);

  static void register(String username, String password) {
    // Aquí se puede implementar la lógica para registrar al usuario
    // Puede ser una llamada a una API, almacenamiento en una base de datos, etc.
    // En este ejemplo, solo se crea una instancia de la clase User
    User newUser = User(username, password);
    // Se puede realizar cualquier otra acción necesaria, como almacenar el nuevo usuario en una lista, base de datos, etc.
  }
}
