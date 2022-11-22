import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/constants/mediaquares.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                    Text('MacBook',style: TextStyle(fontSize: 16.sp),),
                    Text("Mahsulotla soni : 1 x 1200",style: TextStyle(color: Colors.purple,fontSize: 14),)
                  ],
                ),
                Container(
                  height: 60,
                  width: 50,
                  color: Colors.red,
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,size: 32,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
