// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/Pages/enum.dart';
import 'package:auctions_parcial/Pages/bottomNavBar.dart';

class ValueProposition extends StatefulWidget {
  @override
  State<ValueProposition> createState() => _ValuePropositionState();
}

class _ValuePropositionState extends State<ValueProposition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ofertas realizadas"),
      ),
      bottomNavigationBar:
          BottomNavBar(selectedMenu: MenuState.valueProposition),
    );
  }
}
