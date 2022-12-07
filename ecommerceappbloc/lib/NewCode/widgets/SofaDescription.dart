import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class SofaDescription extends StatelessWidget {
  final SofaModel sofaModel;
  const SofaDescription({Key? key, required this.sofaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: ReadMoreText(
        sofaModel.description,
        trimLines: 2,
        trimMode: TrimMode.Line,
        style: TextStyle(
          color: Colors.grey,
          height: 1.5.h
        ),
        trimCollapsedText: 'more',
        trimExpandedText: 'less',
      ),
    );
  }
}
