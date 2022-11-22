class Product {
  // "id":1,
  // "category_id":1,
  // "name":"Macbook",
  // "price":1200,
  // "image_url":"https://e7.pngegg.com/pngimages/765/477/png-clipart-macbook-macbook.png",
  // "description":"Bu description bo'ladi"

  int id;
  int category_id;
  String name;
  num price;
  String image_url;
  String description;

  Product(
      {required this.image_url,
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.category_id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image_url: json["image_url"] ?? "",
      id: json['id'] ?? 0,
      name: json['name'] ?? "No name",
      description: json["description"] ?? "No data",
      price: json['price'] ?? 0,
      category_id: json['category_id'] ?? 0,
    );
  }

  Map toJson(Product product) {
    return {
      id: product.id,
      price: product.price,
      description: product.description,
      name: product.name,
      image_url: product.image_url,
    };
  }
}
