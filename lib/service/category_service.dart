import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../core/models/category_model.dart';

Future<AppCategory?> getHDForecast() async {



  Uri uri= Uri.parse("https://third-exam.free.mockoapp.net/categories");

  var response= await http.get(uri);
  if(response.statusCode==200){
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    return AppCategory.fromJSon(jsonResponse);
  }
  return null;


}