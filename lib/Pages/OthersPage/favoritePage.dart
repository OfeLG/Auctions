// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/Pages/enum.dart';
import 'package:auctions_parcial/Pages/bottomNavBar.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos favoritos"),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.favoritePage),
    );
  }
}
