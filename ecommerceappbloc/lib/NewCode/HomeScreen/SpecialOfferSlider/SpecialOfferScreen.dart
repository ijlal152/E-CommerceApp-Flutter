import 'package:ecommerceappbloc/NewCode/Models/SpecialOfferModel.dart';
import 'package:ecommerceappbloc/NewCode/widgets/special_offer_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOfferSlider extends StatefulWidget {
  const SpecialOfferSlider({Key? key}) : super(key: key);

  @override
  State<SpecialOfferSlider> createState() => _SpecialOfferSliderState();
}

class _SpecialOfferSliderState extends State<SpecialOfferSlider> {

  late final List<SpecialOffer> specials = homeSpecialOffers;
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            color: const Color(0xFFE7E7E7),
            borderRadius: BorderRadius.all(Radius.circular(32.r)),
          ),
          child: PageView.builder(
            itemBuilder: (context, index) {
              final data = specials[index];
              return SpecialOfferWidget(context, data: data, index: index);
            },
            itemCount: specials.length,
            allowImplicitScrolling: true,
            onPageChanged: (value) {
              setState(() => selectIndex = value);
            },
          ),
        ),
        _buildPageIndicator(),
      ],
    );
  }


  Widget _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < specials.length; i++) {
      list.add(i == selectIndex ? _indicator(true) : _indicator(false));
    }
    return Container(
      height: 30.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 5.0.w),
        height: 4.0.h,
        width: isActive ? 16 : 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.r)),
          color: isActive ? const Color(0XFF101010) : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }

}
