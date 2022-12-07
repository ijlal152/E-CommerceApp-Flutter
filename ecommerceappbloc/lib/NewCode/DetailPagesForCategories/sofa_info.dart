import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:ecommerceappbloc/NewCode/widgets/SofaDescription.dart';
import 'package:ecommerceappbloc/NewCode/widgets/sofa_gallery.dart';
import 'package:ecommerceappbloc/NewCode/widgets/sofa_header.dart';
import 'package:ecommerceappbloc/NewCode/widgets/sofa_review.dart';
import 'package:flutter/material.dart';

class SofaInfo extends StatelessWidget {
  final SofaModel sofaModel;
  const SofaInfo({Key? key, required this.sofaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SofaHeader(sofaModel: sofaModel),
          SofaGallery(sofaModel: sofaModel),
          SofaDescription(sofaModel: sofaModel),
          SofaReview(sofaModel: sofaModel),
        ],
      ),
    );
  }
}
