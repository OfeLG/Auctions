import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:auctions_parcial/Models/model_products.dart';

class Auctions_Provider {
  Future<List<ModelProducts>> getProducts() async {
    final resp =
        await http.get(Uri.parse("https://fakestoreapi.com/products/"));

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final products = Products.fromJsonList(jsonData);
      return products.items;
    } else {
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}
