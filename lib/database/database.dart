import 'package:sqflite/sqflite.dart';
import 'package:third_exam_1/core/models/product_model.dart';

class LocalDatabase{
  static String tablename="";
  static LocalDatabase getInstance=LocalDatabase._init();

  Database? _database;
  LocalDatabase._init();


  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb("Cart.db");
      return _database!;
    }
    return _database!;
  }


  Future <Database> _initDb(String fileName) async{
    var dbPath=await getDatabasesPath();
    String path=dbPath+fileName;

    Database database=await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
          String textType = "TEXT";
          String intType = "INTEGER";
          String boolType = "INTEGER";
          await db.execute('''
      Create table $tablename(
            databaseid $idType,
            id $intType
            category_id $intType,
            name $textType,
            price $intType,
            image_url $textType,
            description $textType
      )
      ''');
        }
    );
    return database;
  }


  static Future<Product> insertToDatabase(Product product) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tablename, product.toJson());
    print("HAMMASI YAXSHI");
    return product.copyWith(id: id);


  }

  static Future<List<Product>> getList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tablename, columns: [
      "id" ,
      "category_id" ,
      "name" ,
      "price" ,
      "image_url" ,
      "description"
    ]);
    List <Product> list =listOfTodos.map((e) => Product.fromJson(e)).toList();


    return list;
  }

  static Future<Product> updateTaskById(Product product) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tablename,
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
    print("HAMMASI YAXSHI");
    return product.copyWith(id: id);
  }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}