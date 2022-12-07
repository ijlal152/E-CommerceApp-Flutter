import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Color(0xFFf3f3f3),
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      child: Center(
        child: TextField(
          onChanged: (value) => log(value),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: const Icon(Icons.search),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFFBDBDBD),
            ),
            labelStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF212121),
            ),
          ),
        ),
      ),
    );
  }
}
