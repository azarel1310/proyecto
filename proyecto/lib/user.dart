import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String username;
  final String password;

  final String lastName;
  final String maternalLastName;
  final String phone;
  final String neighborhood;
  final String postalCode;
  final String emergencyContact;
  final String emergencyPhone;

  User(
    this.username,
    this.password,
    this.lastName,
    this.maternalLastName,
    this.phone,
    this.neighborhood,
    this.postalCode,
    this.emergencyContact,
    this.emergencyPhone,
  );
  static Future<void> register(
      String username,
      String password,
      String lastName,
      String maternalLastName,
      String phone,
      String neighborhood,
      String postalCode,
      String emergencyContact,
      String emergencyPhone) async {
    User newUser = User(username, password, lastName, maternalLastName, phone,
        neighborhood, postalCode, emergencyContact, emergencyPhone);
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

  void modifyUser(
      {required String username,
      required String lastName,
      required String maternalLastName,
      required String phone,
      required String neighborhood,
      required String postalCode,
      required String emergencyContact,
      required String emergencyPhone}) {}
}
