import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/mediaquares.dart';

class categoryItemWidget extends StatelessWidget {
  const categoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12).r,
      height: m_w(context)*0.3,
      width: m_w(context)*1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: Colors.red,
      ),
      child: Row(
        children: [
          Container(
            height: m_w(context)*0.3,
            width: m_w(context)*0.32,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)).r,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Nimadir"),
            ),
          )
        ],
      ),

    );
  }
}
