import 'package:flutter/material.dart';
import 'package:third_exam_1/core/models/category_model.dart';
import 'package:third_exam_1/pages/home/cart_page.dart';
import 'package:third_exam_1/pages/home/category_page.dart';
import 'package:third_exam_1/pages/home/home_page.dart';

import '../../pages/home/main_page.dart';
import '../../pages/splash_page.dart';

class RouteName{
  static const splash_page="splash";
  static const home="home";
  static const main="main";
  static const cart="cart";
  static const category="ctgry";


}

class AppRoutes{
  static Route generateRoutes(RouteSettings settings){
    var args=settings.arguments;
    switch(settings.name){
      case RouteName.splash_page: return MaterialPageRoute(builder: (_)=>SplashPage());
      case RouteName.home: return MaterialPageRoute(builder: (_)=>HomePage());
      case RouteName.main: return MaterialPageRoute(builder: (_)=>MainPage());
      case RouteName.cart: return MaterialPageRoute(builder: (_)=>CartPage());
      case RouteName.category: return MaterialPageRoute(builder: (_)=>CategoryPage(appCategory: args as AppCategory,));

      default: return MaterialPageRoute(builder: (_)=>Scaffold());
    }
  }
}