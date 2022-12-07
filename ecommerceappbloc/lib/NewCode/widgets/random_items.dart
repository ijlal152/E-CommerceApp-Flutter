import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RandomItems extends StatelessWidget {
  const RandomItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.w,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h
          ),
          itemCount: 10,
          itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text('Product name'),
            );
          }
      ),
    );
  }
}
