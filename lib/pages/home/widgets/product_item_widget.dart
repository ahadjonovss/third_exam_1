import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_exam_1/database/database.dart';
import 'package:third_exam_1/pages/home/main_page.dart';

import '../../../core/constants/mediaquares.dart';
import '../../../core/models/product_model.dart';
import '../../../core/utils/cart_items.dart';

class productItemWidget extends StatefulWidget {
  VoidCallback ondeletd;
  Product product;
  productItemWidget({required this.product,required this.ondeletd,Key? key}) : super(key: key);

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
          InkWell(
            onTap: () async {
              bool isHas=false;
              Product founded=Product(image_url: "image_url", id: 0, name: "name", description: "description", price: 1, category_id: 1);
              for(Product i in cart_items){
                if(widget.product.name==i.name){
                  print(widget.product.name);
                  print(i.name);
                  isHas=true;
                  founded=i;
                }
              }
              if(isHas==false){
                if(widget.product.count==0){
                  widget.product.count+=1;
                  await LocalDatabase.insertToDatabase(widget.product);
                }
              }
              else{
                await LocalDatabase.deleteTaskById(widget.product.id);
                founded.count+=1;
                await LocalDatabase.insertToDatabase(founded);
              }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 1500),
                content: Text("${widget.product.name} savatga qo'shildi"),
              ));

            },
            child: Container(
              height: 32.h,
              width: 140.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4).r,
              ),
              child: const Center(
                child: Text("Savatga qo'shish",style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
