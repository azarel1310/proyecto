import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String username;
  String password;
  String lastName;
  String maternalLastName;
  String phone;
  String neighborhood;
  String postalCode;
  String emergencyContact;
  String emergencyPhone;

  User({
    required this.username,
    required this.password,
    required this.lastName,
    required this.maternalLastName,
    required this.phone,
    required this.neighborhood,
    required this.postalCode,
    required this.emergencyContact,
    required this.emergencyPhone,
  });

  static Future<void> register(
    String username,
    String password,
    String lastName,
    String maternalLastName,
    String phone,
    String neighborhood,
    String postalCode,
    String emergencyContact,
    String emergencyPhone,
  ) async {
    User newUser = User(
      username: username,
      password: password,
      lastName: lastName,
      maternalLastName: maternalLastName,
      phone: phone,
      neighborhood: neighborhood,
      postalCode: postalCode,
      emergencyContact: emergencyContact,
      emergencyPhone: emergencyPhone,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario', newUser.username);
    await prefs.setString('contraseña', newUser.password);
    await prefs.setString('Apellidopaterno', newUser.lastName);
    await prefs.setString('ApellidoMaterno', newUser.maternalLastName);
    await prefs.setString('telefono', newUser.phone);
    await prefs.setString('colonia', newUser.neighborhood);
    await prefs.setString('codigoPostal', newUser.postalCode);
    await prefs.setString('ContactodeEmergencia', newUser.emergencyContact);
    await prefs.setString('TelefonodeEmergencia', newUser.emergencyPhone);
  }

  static Future<bool> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('usuario');
    String? storedPassword = prefs.getString('contraseña');

    if (storedUsername == username && storedPassword == password) {
      return true;
    } else {
      return false;
    }
  }

  static Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('usuario');
    String? password = prefs.getString('contraseña');
    String? lastName = prefs.getString('Apellidopaterno');
    String? maternalLastName = prefs.getString('ApellidoMaterno');
    String? phone = prefs.getString('telefono');
    String? neighborhood = prefs.getString('colonia');
    String? postalCode = prefs.getString('codigoPostal');
    String? emergencyContact = prefs.getString('ContactodeEmergencia');
    String? emergencyPhone = prefs.getString('TelefonodeEmergencia');

    if (username != null &&
        password != null &&
        lastName != null &&
        maternalLastName != null &&
        phone != null &&
        neighborhood != null &&
        postalCode != null &&
        emergencyContact != null &&
        emergencyPhone != null) {
      return User(
        username: username,
        password: password,
        lastName: lastName,
        maternalLastName: maternalLastName,
        phone: phone,
        neighborhood: neighborhood,
        postalCode: postalCode,
        emergencyContact: emergencyContact,
        emergencyPhone: emergencyPhone,
      );
    }

    return null;
  }

  static Future<void> modifyUser({
    String? username,
    String? password,
    String? lastName,
    String? maternalLastName,
    String? phone,
    String? neighborhood,
    String? postalCode,
    String? emergencyContact,
    String? emergencyPhone,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (username != null) await prefs.setString('usuario', username);
    if (password != null) await prefs.setString('contraseña', password);
    if (lastName != null) await prefs.setString('Apellidopaterno', lastName);
    if (maternalLastName != null)
      await prefs.setString('ApellidoMaterno', maternalLastName);
    if (phone != null) await prefs.setString('telefono', phone);
    if (neighborhood != null) await prefs.setString('colonia', neighborhood);
    if (postalCode != null) await prefs.setString('codigoPostal', postalCode);
    if (emergencyContact != null)
      await prefs.setString('ContactodeEmergencia', emergencyContact);
    if (emergencyPhone != null)
      await prefs.setString('TelefonodeEmergencia', emergencyPhone);
  }
}
