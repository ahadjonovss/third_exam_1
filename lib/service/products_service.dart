import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:third_exam_1/core/models/product_model.dart';

import '../core/models/category_model.dart';

Future<List?>getProducts(int id) async {

  Uri uri= Uri.parse("https://third-exam.free.mockoapp.net/categories/$id");

  var response= await http.get(uri);
  if(response.statusCode==200){
    var jsonResponse =
    convert.jsonDecode(response.body);
    return jsonResponse.map((e) => Product.fromJson(e)).toList();
  }
  return null;


}