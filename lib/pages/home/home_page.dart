import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/constants/mediaquares.dart';
import 'package:third_exam_1/pages/home/widgets/category_item.dart';
import 'package:third_exam_1/service/category_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getCategory(),
       builder: (context, snapshot) {
         if(snapshot.hasData){
           List categories=snapshot.data!;
           return Container(
               padding: const EdgeInsets.all(12).r,
               child: ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) => categoryItemWidget(appCategory: categories[index]),
                 itemCount: categories.length,
               )
           );
         }

         if(snapshot.hasError){
           return Container(
             child: Center(
               child: Text(snapshot.error.toString()),
             ),
           );
         }
         return Container();
       },
      ),
    );
  }
}
