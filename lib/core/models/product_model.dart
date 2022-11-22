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

  Map<String,dynamic> toJson() {
    return {
      "id": this.id,
      "price": this.price,
      "description": this.description,
      "name": this.name,
      "image_url": this.image_url,
    };
  }

  Product copyWith({
    int? id,
    int? category_id,
    String? name,
    num? price,
    String? image_url,
    String? description,
  })=>
      Product(
        id: id ?? this.id,
        image_url: image_url??this.image_url,
        description: description??this.description,
        price: price??this.price,
        category_id: category_id??this.category_id,
        name: name??this.name,

      );
}
