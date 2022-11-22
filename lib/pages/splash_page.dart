import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_exam_1/core/routes/app_routes.dart';
import 'package:third_exam_1/database/database.dart';
import 'package:third_exam_1/pages/home/main_page.dart';

import '../core/utils/cart_items.dart';

class SplashPage extends StatelessWidget {
   SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => LocalDatabase.getList().then((value) => Navigator.pushNamedAndRemoveUntil(context, RouteName.main, (route) => false)));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Nimadir"),
        ),
      ),
    );
  }
}
