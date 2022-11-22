import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/mediaquares.dart';
import '../../../core/models/product_model.dart';

class productItemWidget extends StatefulWidget {
  Product product;
  productItemWidget({required this.product,Key? key}) : super(key: key);

  @override
  State<productItemWidget> createState() => _productItemWidgetState();
}

class _productItemWidgetState extends State<productItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: m_w(context)*0.72,
      width: m_w(context)*0.47,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12)

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: m_w(context)*0.32,
            width: m_w(context)*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image_url),
                fit: BoxFit.cover
              )
            ),

          ),
          Center(
            child: Text(widget.product.name,
              maxLines: 1,
              style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
          ),
          Center(child: Text("USD ${widget.product.price}",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w600,fontSize: 18.sp),)),
          Container(
            height: 32.h,
            width: 140.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4).r,
            ),
            child: const Center(
              child: Text("Savatga qo'shish",style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
