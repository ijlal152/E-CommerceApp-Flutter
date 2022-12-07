import 'package:ecommerceappbloc/NewCode/HomeScreen/CategoryScreens/CategoryItems.dart';
import 'package:ecommerceappbloc/NewCode/HomeScreen/SpecialOfferSlider/SpecialOfferScreen.dart';
import 'package:ecommerceappbloc/NewCode/widgets/popular_category_widget.dart';
import 'package:ecommerceappbloc/NewCode/widgets/random_items.dart';
import 'package:ecommerceappbloc/NewCode/widgets/searchfield.dart';
import 'package:ecommerceappbloc/NewCode/widgets/special_offer.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final assetList = [
    AssetImage('assets/images/background_images/1.jpg'),
    AssetImage('assets/images/background_images/8d366d46bc1593d8ef351d2493feb404.jpg'),
    AssetImage('assets/images/background_images/1628524195-kitchen-knives-2021-korin-1628521180.jpg'),
    AssetImage('assets/images/background_images/java_dining_chair.jpg'),
    AssetImage('assets/images/background_images/vase3.jpg'),
    AssetImage('assets/images/background_images/vase-with-tulips-roses_23-2148860050.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    //RPadding = EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h)
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: EdgeInsets.only(top: 25.h),
            sliver: const SliverAppBar(
              pinned: true,
              flexibleSpace: HomeAppBar(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 24.w, 0.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => _buildBody(context)),
                childCount: 1,
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 24.w, 0.h),
            sliver: buildRandomGridItems(),
          ),
          SliverAppBar(flexibleSpace: SizedBox(height: 20.h,),)
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
        SizedBox(height: 20.h,),
        const SpecialOffer(),
        SizedBox(height: 20.h,),
        const SpecialOfferSlider(),
        SizedBox(height: 10.h,),
        CategoryItems(),
        const PopularCategoriesList(),
        //SizedBox(height: 15.h),
        //RandomItems(),
        // SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
        // const SizedBox(height: 15),
        // MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
        // const SizedBox(height: 15),
        // const MostPupularCategory(),
      ],
    );
  }
  Widget buildRandomGridItems(){
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(buildRandomCard, childCount: assetList.length),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.w,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h
        ),
    );
  }
  Widget buildRandomCard(BuildContext context, int index){
    return Container(
      height: 60.h,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(image: assetList[index], fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 0.5, style: BorderStyle.solid,
          color: Colors.grey
        )
      ),
    );
  }
}
