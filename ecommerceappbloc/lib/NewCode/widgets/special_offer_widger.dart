import 'package:ecommerceappbloc/NewCode/Models/SpecialOfferModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SpecialOfferWidget extends StatelessWidget {
  const SpecialOfferWidget(
      this.context, {
        Key? key,
        required this.data,
        required this.index,
      }) : super(key: key);

  final SpecialOffer data;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.discount,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  data.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                SizedBox(height: 12.h),
                Text(
                  data.detail,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
        Image.asset(data.icon),
      ],
    );
  }
}