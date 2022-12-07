import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Special Offers',
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
    );
  }
}
