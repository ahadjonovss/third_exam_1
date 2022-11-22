import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/database/database.dart';
import 'package:third_exam_1/pages/home/cart_page.dart';
import 'package:third_exam_1/pages/home/home_page.dart';

import '../../core/utils/cart_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
int currentpage=0;
class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    getCartItem();
    List pages=[
      HomePage(),
      CartPage()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(currentpage==0?"Kategoriyalar ro'yxati":"Savatcha"),
        actions: [
          currentpage==1?InkWell(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) =>  AlertDialog(
                content: const Text(
                    "Rostdan ham savatchadagi ma'lumotlarni tozalamoqchimisiz?"),
                actions: <Widget>[
                   TextButton(onPressed: (){
                     Navigator.pop(context);
                   }, child: const Text("Yo'q")),
                  TextButton(onPressed: () async {
                    await LocalDatabase.deleteAll();
                    Navigator.pop(context);
                    setState(() {});
                  }, child: const Text("Ha")),
                ],
              ),
              );
            },
            child: Center(
              child: Text("Tozalash",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
            ),
          ):Container(),
          SizedBox(width: 20.w,)
        ],
      ),
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: currentpage,
        onTap: (value) {
          currentpage=value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),label: "Savatcha"),
        ],
      ),
    );
  }
}
