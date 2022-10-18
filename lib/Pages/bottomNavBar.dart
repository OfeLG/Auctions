// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/enum.dart';
import 'package:auctions_parcial/Pages/home.dart';
import 'package:auctions_parcial/Pages/OthersPage/favoritePage.dart';
import 'package:auctions_parcial/Pages/OthersPage/valueProposition.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);
  //Para validar si alguna opción ha sido seleccionada
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          //Se le agrega un bordeado circular en la parte izquierda y derecha del contenedor
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        //Se le agresa un borde sombreado
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDADADA),
            offset: Offset(0, -15),
            blurRadius: 20,
          )
        ],
      ),
      //Se usa el widget SafeArea para mostrar la barra inferior que tendrá la app
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //Se usa Row para colocar cada uno de los iconButton de la barra inferior
          children: [
            IconButton(
              //Se le agrega a acción al icono, en este caso se le dirá que nos direccione ala ruta especificada
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(
                Icons.home,
                size: 40,
                color: MenuState.home == selectedMenu
                    ? primaryColor
                    : inactiveColor,
              ),
            ),
            IconButton(
              //Se le agrega a acción al icono, en este caso se le dirá que nos direccione ala ruta especificada
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorite()),
                );
              },
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: MenuState.favoritePage == selectedMenu
                    ? primaryColor
                    : inactiveColor,
              ),
            ),
            IconButton(
              //Se le agrega a acción al icono, en este caso se le dirá que nos direccione a la ruta especificada
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ValueProposition()),
                );
              },
              icon: Icon(
                Icons.shopping_basket,
                size: 40,
                color: MenuState.valueProposition == selectedMenu
                    ? primaryColor
                    : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
