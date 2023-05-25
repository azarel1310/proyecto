import 'package:flutter/material.dart';
import 'package:proyecto/perfil.dart';
import 'package:proyecto/user.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Acciones a realizar cuando se presione el botón circular
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (int index) {
          if (index == 3) {
            // Navegar a la página de perfil
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(user: user),
              ),
            );
          }
        },
      ),
    );
  }
}
