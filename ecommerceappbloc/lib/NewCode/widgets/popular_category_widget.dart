import 'package:ecommerceappbloc/NewCode/Models/PopularCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCategoriesList extends StatefulWidget {
  const PopularCategoriesList({Key? key}) : super(key: key);

  @override
  State<PopularCategoriesList> createState() => _PopularCategoriesListState();
}

class _PopularCategoriesListState extends State<PopularCategoriesList> {

  final categoryList = homePopularCategoriesList;
  int _selectIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular categories',
              style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            Text('See all',style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 38.h,
          child: ListView.separated(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _buildItem,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 12.w);
            },
          ),
        ),

      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = categoryList[index];
    final isActive = _selectIndex == index;
    final radius = BorderRadius.all(Radius.circular(19.r));
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: const Color(0xFF101010), width: 2.w),
        color: isActive ? const Color(0xFF101010) : const Color(0xFFFFFFFF),
      ),
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: radius,
        onTap: () => _onTapItem(index),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
          child: Text(
            data.category,
            style: TextStyle(
              color: isActive ? const Color(0xFFFFFFFF) : const Color(0xFF101010),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // user interact the item of special offers.
  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
