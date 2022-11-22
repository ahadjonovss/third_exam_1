import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/constants/mediaquares.dart';
import 'package:third_exam_1/database/database.dart';
import 'package:third_exam_1/pages/home/widgets/cart_item.dart';

import '../../core/models/product_model.dart';

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
            num getSum(){
              num sum=0;
              for(var i in products){
                sum+=i.price*i.count;
              }
              return sum;
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Product product=snapshot.data![index];
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
                            IconButton(
                                onPressed: () async {
                                  await LocalDatabase.deleteTaskById(product.id);
                                  setState(() {

                                  });
                                }, icon: Icon(Icons.delete,color: Colors.red,size: 32,))
                          ],
                        ),
                      );
                    },),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  margin: const EdgeInsets.only(bottom: 12).r,
                  height: 50.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    borderRadius: BorderRadius.circular(12).r
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Umumiy summa ---->",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                      Text("\$${getSum()}",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w600,fontSize: 18.sp),)
                    ],
                  )
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
