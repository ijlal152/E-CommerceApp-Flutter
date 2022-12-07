import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:ecommerceappbloc/NewCode/widgets/CustomButton.dart';
import 'package:ecommerceappbloc/NewCode/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerceappbloc/bloc/exports.dart';

class SofaReview extends StatelessWidget {
  final SofaModel sofaModel;
  SofaReview({Key? key, required this.sofaModel}) : super(key: key);

  IconData icon = Icons.shopping_cart_checkout_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rating and Reviews', style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              Text('View', style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey
              ),),
              
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sofaModel.ratingscrore.toString() , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48.sp
              ),
              ),
              SizedBox(width: 15.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStars(),
                  SizedBox(height: 5.h,),
                  Text('${sofaModel.reviews} review', style: const TextStyle(
                      color: Colors.grey
                  ),)
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          InkWell(
            onTap: (){
              var cartItem = SofaModel(
                  sofaModel.title, sofaModel.ratingscrore,
                  sofaModel.sold, sofaModel.price,
                  sofaModel.discount, sofaModel.icon, sofaModel.description,
                  sofaModel.qty,
                  sofaModel.totalPrice,
                  sofaModel.reviews, sofaModel.imgs, sofaModel.totalSum,
                  sofaModel.id
              );
              context.read<CartBloc>().add(AddProductEvent(cartItem));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item added to cart'),
                duration: Duration(microseconds: 900),)
              );
            },
            child: const RoundButton(
                title: 'Add to cart',
               icon: Icons.shopping_cart_checkout_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
