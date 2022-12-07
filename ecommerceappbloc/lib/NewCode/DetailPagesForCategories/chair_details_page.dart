import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/SliverDelegate/ChairDetailSliverDelegate.dart';
import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChairDetailsPage extends StatelessWidget {
  final ChairModel chairModel;
  const ChairDetailsPage({Key? key, required this.chairModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: ChairDetailSliverDelegate(
                  chairModel,
                  360.h,
                  30.h
              ),
          )
        ],
      ),
    );
  }
}
