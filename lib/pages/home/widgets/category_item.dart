import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_exam_1/core/models/category_model.dart';
import 'package:third_exam_1/core/routes/app_routes.dart';

import '../../../core/constants/mediaquares.dart';

class categoryItemWidget extends StatelessWidget {
  AppCategory appCategory;
  categoryItemWidget({required this.appCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteName.category,
            arguments: appCategory);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12).r,
        height: m_w(context) * 0.3,
        width: m_w(context) * 1,
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
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Row(
          children: [
            Container(
              height: m_w(context) * 0.3,
              width: m_w(context) * 0.32,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12))
                      .r,
                  image: DecorationImage(
                      image: NetworkImage(appCategory.image_url),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Center(
                child: Text(appCategory.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
