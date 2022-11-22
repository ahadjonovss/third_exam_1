import '../../database/database.dart';
import '../models/product_model.dart';

List<Product> cart_items=[];
getCartItem() async {
  cart_items= await LocalDatabase.getList();
}