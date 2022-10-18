class Products {
  List<ModelProducts> items = [];

  Products();

  Products.fromJsonList(jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final product = new ModelProducts.fromJsonMap(item);
      items.add(product);
    }
  }
}

class ModelProducts {
  late String category;
  late String title;
  late double price;
  late String description;
  late String imgURL;

  ModelProducts(
      this.category, this.title, this.price, this.description, this.imgURL);

  ModelProducts.fromJsonMap(Map<String, dynamic> json) {
    category = json["category"];
    title = json["title"];
    price = json["price"];
    description = json["description"];
    imgURL = json["image"];
  }
}
