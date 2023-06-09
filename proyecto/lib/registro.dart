import 'package:flutter/material.dart';
import 'package:proyecto/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _maternalLastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _neighborhoodController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _emergencyContactController = TextEditingController();
  TextEditingController _emergencyPhoneController = TextEditingController();

  void _register() {
    // Obtener los valores de los controladores de texto
    String username = _usernameController.text;
    String password = _passwordController.text;

    String lastName = _lastNameController.text;
    String maternalLastName = _maternalLastNameController.text;
    String phone = _phoneController.text;
    String neighborhood = _neighborhoodController.text;
    String postalCode = _postalCodeController.text;
    String emergencyContact = _emergencyContactController.text;
    String emergencyPhone = _emergencyPhoneController.text;

    // Lógica para registrar al usuario
    User.register(
      username,
      password,
      lastName,
      maternalLastName,
      phone,
      neighborhood,
      postalCode,
      emergencyContact,
      emergencyPhone,
    );

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
                Navigator.pop(
                    context); // Vuelve a la página de inicio de sesión (login)
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
        child: SingleChildScrollView(
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
              SizedBox(height: 12.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellido Paterno',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _maternalLastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellido Materno',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _neighborhoodController,
                decoration: InputDecoration(
                  labelText: 'Colonia',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Código Postal',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emergencyContactController,
                decoration: InputDecoration(
                  labelText: 'Contacto de Emergencia',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emergencyPhoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono de Emergencia',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('Registrarse'),
                onPressed: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
