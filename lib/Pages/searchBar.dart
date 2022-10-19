// Se importa el paquete material.dart
import 'package:flutter/material.dart';

// Se importan los archivos del proyecto que tienen relación con esta pagina
import 'package:auctions_parcial/constants.dart';
import 'package:auctions_parcial/Pages/searching.dart';
import 'package:auctions_parcial/Models/model_products.dart';

class SearchBar extends StatefulWidget {
  final List<ModelProducts> productsList;
  final void Function() get_all;
  const SearchBar({
    Key? key,
    required this.get_all,
    required this.productsList,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Se crea el widget que contendrá toda la parte del buscador (row)
          Row(
            children: [
              //Se usa el Expanded para que el container del TextField ocupe todo el epacio disponible de su padre (Row)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, //Se aplica color al contendor
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      //Se aplica sombra al contendor,
                      BoxShadow(color: Colors.black38, blurRadius: 4)
                    ],
                  ),
                  child: TextField(
                    //Se indica que al darle click TextField se llama automaticamente una función de flutter
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: Searching(widget.productsList));
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      //Se quita la linea inferior que tiene por defecto el TextField
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              //Se crea el boton de clasificación que tendrá la app
              Container(
                // Este contenedor tendrá dento el icono de
                decoration: BoxDecoration(
                  color: primaryColor, //Se aplica color al contendor
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    //Se aplica sombra al contendor,
                    BoxShadow(color: Colors.black38, blurRadius: 4)
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    widget.get_all();
                  },
                  icon: Icon(Icons.casino),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
