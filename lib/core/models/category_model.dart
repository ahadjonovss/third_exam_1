class Category {
  // "id":1,
  // "name":"Computers",
  // "image_url":"https://www.microsoft.com/en-us/microsoft-365/blog/wp-content/uploads/sites/2/2020/05/Dell-1.png",
  // "created_at":"2022-10-21 06:11:45.559309"

  int id;
  String name;
  String image_url;
  String created_at;

  Category(
      {required this.name,
      required this.id,
      required this.created_at,
      required this.image_url});
}