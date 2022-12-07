import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:flutter/material.dart';

class SofaDetailSliverDelegate extends SliverPersistentHeaderDelegate{
  final SofaModel sofaModel;
  final expandedHeight;
  final double roundedContainerHeight;

  SofaDetailSliverDelegate(this.sofaModel, this.expandedHeight, this.roundedContainerHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(sofaModel.icon,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}