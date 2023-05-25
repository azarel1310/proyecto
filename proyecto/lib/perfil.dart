import 'package:flutter/material.dart';
import 'package:proyecto/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _maternalLastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _neighborhoodController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _emergencyContactController = TextEditingController();
  TextEditingController _emergencyPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores de texto con los datos del usuario
    _usernameController.text = widget.user.username;
    _lastNameController.text = widget.user.lastName;
    _maternalLastNameController.text = widget.user.maternalLastName;
    _phoneController.text = widget.user.phone;
    _neighborhoodController.text = widget.user.neighborhood;
    _postalCodeController.text = widget.user.postalCode;
    _emergencyContactController.text = widget.user.emergencyContact;
    _emergencyPhoneController.text = widget.user.emergencyPhone;
  }

  void _modifyUser() {
    // Obtener los nuevos valores de los controladores de texto
    String username = _usernameController.text;
    String lastName = _lastNameController.text;
    String maternalLastName = _maternalLastNameController.text;
    String phone = _phoneController.text;
    String neighborhood = _neighborhoodController.text;
    String postalCode = _postalCodeController.text;
    String emergencyContact = _emergencyContactController.text;
    String emergencyPhone = _emergencyPhoneController.text;

    // Modificar los datos del usuario
    widget.user.modifyUser(
      username: username,
      lastName: lastName,
      maternalLastName: maternalLastName,
      phone: phone,
      neighborhood: neighborhood,
      postalCode: postalCode,
      emergencyContact: emergencyContact,
      emergencyPhone: emergencyPhone,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modificación exitosa'),
          content:
              Text('Los datos del usuario han sido modificados correctamente.'),
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
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellido Paterno',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _maternalLastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellido Materno',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _neighborhoodController,
                decoration: InputDecoration(
                  labelText: 'Colonia',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Código Postal',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emergencyContactController,
                decoration: InputDecoration(
                  labelText: 'Contacto de Emergencia',
                ),
                enabled: false,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emergencyPhoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono de Emergencia',
                ),
                enabled: false,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                child: Text('Modificar'),
                onPressed: () {
                  // Habilitar la edición de los campos
                  setState(() {
                    _usernameController..enabled = true;
                    _lastNameController..enabled = true;
                    _maternalLastNameController..enabled = true;
                    _phoneController..enabled = true;
                    _neighborhoodController..enabled = true;
                    _postalCodeController..enabled = true;
                    _emergencyContactController..enabled = true;
                    _emergencyPhoneController..enabled = true;
                  });
                },
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                child: Text('Guardar cambios'),
                onPressed: _modifyUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
