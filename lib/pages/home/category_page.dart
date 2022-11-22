import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/constants/mediaquares.dart';
import 'package:third_exam_1/core/models/category_model.dart';
import 'package:third_exam_1/pages/home/widgets/product_item_widget.dart';
import 'package:third_exam_1/service/products_service.dart';

class CategoryPage extends StatefulWidget {
  AppCategory appCategory;
   CategoryPage({required this.appCategory,Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        title: Text(widget.appCategory.name),
      ),
      body: FutureBuilder(
        future: getProducts(widget.appCategory.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List products=snapshot.data!;
            return Container(
              padding: EdgeInsets.all(12),
              child: Container(
                height: m_h(context)*1,
                width: m_w(context)*1,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2/3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12
                  ),
                  itemBuilder: (context, index) => productItemWidget(product:products[index],ondeletd: (){setState(() {

                  });}),

                ),
              ),
            );
          }
          return Container();
        },
      ),

    );
  }
}
