import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/models/product_model.dart';
import 'package:third_exam_1/database/database.dart';

import '../../../core/constants/mediaquares.dart';

class cartItemWidget extends StatelessWidget {
  VoidCallback ondeletd;
  Product product;
   cartItemWidget({required this.product,required this.ondeletd,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20).r,
      height: m_w(context)*0.13,
      width: m_w(context)*1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.name,style: TextStyle(fontSize: 16.sp),),
              Text("Mahsulotla soni : ${product.count} x ${product.price}",style: TextStyle(color: Colors.purple,fontSize: 14),)
            ],
          ),
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image_url),
                fit: BoxFit.cover
              )
            ),
          ),
          IconButton(onPressed: () async {
            await LocalDatabase.deleteTaskById(product.id);
            ondeletd;
          }, icon: Icon(Icons.delete,color: Colors.red,size: 32,))
        ],
      ),
    );
  }
}
