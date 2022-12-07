import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/chair_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/cupboard_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/kitchen_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/lamp_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/other_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/sofa_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/table_page.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/vase_page.dart';
import 'package:ecommerceappbloc/NewCode/Models/ItemCategoryModel.dart';
import 'package:ecommerceappbloc/model/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key}) : super(key: key);

  //late final category_data = homePopularCategories;
  final List<ItemCategoryModel> home_category = homeCategries;

  final CategoryScreens = [
    SofaPage(),
    ChairPage(),
    TablePage(),
    KitchenPage(),
    LampPage(),
    CupboardPage(),
    VasePage(),
    OtherPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 100.h,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 24.w,
            maxCrossAxisExtent: 77.w,
          ),
          itemCount: home_category.length,
          itemBuilder: ((context, index){
            final data = home_category[index];
            return GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute<Widget>(builder: (context) {
                    return CategoryScreens[index];
                  })),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x10101014),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(data.icon, width: 28.w, height: 28.h),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  FittedBox(
                    child: Text(
                      data.title,
                      style: TextStyle(
                          color: const Color(0xff424242),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
      ),
    );
  }
}
