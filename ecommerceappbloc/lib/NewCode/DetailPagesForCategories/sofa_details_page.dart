import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/SliverDelegate/SofaDetailSliverDelegate.dart';
import 'package:ecommerceappbloc/NewCode/DetailPagesForCategories/sofa_info.dart';
import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SofaDetailsPage extends StatelessWidget {
  final SofaModel sofaModel;
  const SofaDetailsPage({Key? key, required this.sofaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SofaDetailSliverDelegate(
                sofaModel,
                360.h,
                30.h
            ),
          ),
          SliverToBoxAdapter(
            child: SofaInfo(sofaModel: sofaModel)
          )
        ],
      ),
    );
  }
}
