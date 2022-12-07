import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SofaHeader extends StatelessWidget {
  final SofaModel sofaModel;
  const SofaHeader({Key? key, required this.sofaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          Image.asset(sofaModel.icon, width: 80.w, height: 70.h,),
          SizedBox(width: 15.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(sofaModel.title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp
            ),
            ),
            SizedBox(height: 10.h,),
            Text('Sold: ${sofaModel.sold} Pieces'),
              Row(
                children: [
                  Text('Price: ${sofaModel.price} Rs'),
                  SizedBox(width: 15.w,),
                  Text('Discount: ${sofaModel.discount} %')
                ],
              ),
          ],
          ),
        ],
      ),
    );
  }
}
