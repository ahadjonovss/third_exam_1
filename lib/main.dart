import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392,834),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splash_page,
          onGenerateRoute: AppRoutes.generateRoutes,
          title: 'Shop',
          theme: ThemeData(
            fontFamily: "SF Display",
            primarySwatch: Colors.blue,
          ),
        );
      },

    );
}}
