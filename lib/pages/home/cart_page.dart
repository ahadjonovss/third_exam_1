import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/constants/mediaquares.dart';
import 'package:third_exam_1/database/database.dart';
import 'package:third_exam_1/pages/home/widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Container(
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          if(snapshot.hasData){
            List products=snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return cartItemWidget(product: products[index],ondeletd: (){setState(() {

                      });},);
                    },),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
