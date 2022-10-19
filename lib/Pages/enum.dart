// Se importan un del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/Models/model_products.dart';

enum MenuState {
  home,
  favoritePage,
  valueProposition
} //Se indican cada una de las paginas de las opciones del NavBar

List<ModelProducts> favoriteList =
    []; //Se crea una lista vacia en la que se ingresaran los datos de los productos favoritos

