import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _lastNameController;
  late TextEditingController _maternalLastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _postalCodeController;
  late TextEditingController _emergencyContactController;
  late TextEditingController _emergencyPhoneController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _lastNameController = TextEditingController();
    _maternalLastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _neighborhoodController = TextEditingController();
    _postalCodeController = TextEditingController();
    _emergencyContactController = TextEditingController();
    _emergencyPhoneController = TextEditingController();

    // Obtener el usuario actual de forma asíncrona
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    User? currentUser = await User.getCurrentUser();

    if (currentUser != null) {
      // Asignar los valores de la información del usuario a los controladores de texto
      _usernameController.text = currentUser.username;
      _passwordController.text = currentUser.password;
      _lastNameController.text = currentUser.lastName;
      _maternalLastNameController.text = currentUser.maternalLastName;
      _phoneController.text = currentUser.phone;
      _neighborhoodController.text = currentUser.neighborhood;
      _postalCodeController.text = currentUser.postalCode;
      _emergencyContactController.text = currentUser.emergencyContact;
      _emergencyPhoneController.text = currentUser.emergencyPhone;
    }
  }

  void _saveChanges() {
    // Obtener los nuevos valores de los controladores de texto
    String newUsername = _usernameController.text;
    String newPassword = _passwordController.text;
    String newLastName = _lastNameController.text;
    String newMaternalLastName = _maternalLastNameController.text;
    String newPhone = _phoneController.text;
    String newNeighborhood = _neighborhoodController.text;
    String newPostalCode = _postalCodeController.text;
    String newEmergencyContact = _emergencyContactController.text;
    String newEmergencyPhone = _emergencyPhoneController.text;

    // Modificar los datos del usuario
    User.modifyUser(
      username: newUsername,
      password: newPassword,
      lastName: newLastName,
      maternalLastName: newMaternalLastName,
      phone: newPhone,
      neighborhood: newNeighborhood,
      postalCode: newPostalCode,
      emergencyContact: newEmergencyContact,
      emergencyPhone: newEmergencyPhone,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información actualizada'),
          content: Text(
              'La información del usuario se ha actualizado correctamente.'),
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
        title: Text('Perfil'),
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
                child: Text('Guardar cambios'),
                onPressed: _saveChanges,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
