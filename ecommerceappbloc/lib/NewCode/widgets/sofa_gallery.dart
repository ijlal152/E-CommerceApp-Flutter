import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SofaGallery extends StatelessWidget {
  final SofaModel sofaModel;
  const SofaGallery({Key? key, required this.sofaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
          itemBuilder: (_, index) => SizedBox(
            width: 250.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(sofaModel.imgs[index], fit: BoxFit.cover,),
            ),
          ),
          separatorBuilder: (_, index) => SizedBox(width: 15.w,),
          itemCount: sofaModel.imgs.length
      ),
    );
  }
}
