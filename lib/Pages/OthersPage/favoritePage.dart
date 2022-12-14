// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/Pages/enum.dart';
import 'package:auctions_parcial/Pages/bottomNavBar.dart';
import 'package:auctions_parcial/Widgets/products_Widget.dart';

//Pagina donde se muestran los productos favoritos
class Favorite extends StatefulWidget {
  const Favorite({super.key});
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Titulo del aapbar de la pagina
        title: Text("Productos favoritos"),
      ),
      //Enviar parametro BottomNavBar con el fin de darle color al icono seleccionado en el NavBar
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.favoritePage),
      //Devolverá una listviw con todos los productos favoritos
      body: ListView.builder(
        //favoriteList es una variable global creada en (enum.dart) y que su valor se le asigna en all_products al darle me gusta a un producto
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          return Products_Widget(favoriteList[index]);
        },
      ),
    );
  }
}
