import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_exam_1/pages/home/cart_page.dart';
import 'package:third_exam_1/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
int currentpage=0;
class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentpage==0?"Kategoriyalar ro'yxati":"Savatcha"),
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
