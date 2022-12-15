
import 'dart:io';

import 'package:ecommerceappbloc/NewCode/CheckOutScreen/Check_Out.dart';
import 'package:ecommerceappbloc/bloc/calculateSum/calculate_sum_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import '../../bloc/exports.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var sumList = []; // contains all sums very long list
  var allSums; // iterated list and holds all sums which we need but this id dynamic list
  List<double> doubleSum = []; // converted list [from dynamic to double]
  var totalSum;

  double sum = 0;

  String productName = '';
  List<String> prodName = [];
  List imgs = [];

  String? profilepic;
  File? f;

  //var sum = allSums.map((s) => s as double).toList();
  //var sum = allSums.fold(0, (previous, current) => previous + current);

  @override
  Widget build(BuildContext context) {
    //print(doubleSum);

    return BlocBuilder<CalculateSumCubit, CalculateSumState>(
      builder: (context, st) {
        double total = st.sum;

        return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          List<SofaModel> sofaList = state.cartItem;

          // for(int i=0; i<sofaList.length; i++){
          //   prodName.add(sofaList[i].title);
          // }
          // print('ProdName: $prodName');
          void calculateSum(var list) {
            Iterable inReverse = list.reversed;
            for (int i = 0; i < inReverse.length; i++) {
              allSums = inReverse.take(state.cartItem.length).toList();
              //print(allSums);
              doubleSum = allSums.cast<double>();
              //print('Double Sum: $doubleSum');
              sum = doubleSum.fold(0, (p, c) => p + c);
              context.read<CalculateSumCubit>().showData(sum);
              //print('Sum: $sum');
              //total = sum;
              //print('Sum List: $doubleSum');
              // //sum = doubleSum.sum;
              // sum = doubleSum.fold(0, (p, c) => p + c);
              // print(sum);
            }
          }

          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Items: ${sofaList.length}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Text(
                        'Total $total',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutScreen(
                                      subTotal: total,
                                      productName: prodName,
                                      //imgs: imgs,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          //titles = sofaList[index].title;
                          imgs = sofaList[index].imgs;
                          sofaList[index].totalPrice = sofaList[index].price * sofaList[index].qty;
                          sumList.add(sofaList[index].totalPrice); //[1,2, 3 4]
                          //print(sumList);
                          //print(sofaList);
                          //totalSum = sofaList[index].totalPrice;
                          //print('Total Sum:  $totalSum');
                          calculateSum(sumList); //[5089.0, 7899.0]
                          //print(sofaList[index].totalPrice);
                          //print(sumList);



                          var productIcon;
                          productName = sofaList[index].title;
                          productName.split(',');
                          prodName.add(productName);
                          //print(prodName);
                          productIcon = sofaList[index].icon;
                          //print(productName);
                          //print(productIcon);

                          // Future<File> getImageFileFromAssets(String path) async {
                          //   final byteData = await rootBundle.load(path);
                          //   final file = File('${(await getTemporaryDirectory()).path}/$path');
                          //   await file.writeAsBytes(byteData.buffer
                          //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
                          //   return file;
                          // }
                          //
                          // showimage() async{
                          //   f = await getImageFileFromAssets(productIcon);
                          //   //print('image converted successfully');
                          //   //print(f);
                          //   Uint8List imagebytes = await f!.readAsBytes();
                          //   //print(imagebytes);
                          //   profilepic = base64.encode(imagebytes);
                          //   print(profilepic);
                          // }
                          // showimage();

                          return Container(
                            padding: EdgeInsets.only(
                                top: 15.h,
                                left: 10.w,
                                right: 15.w,
                                bottom: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0x10101014),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            height: 200.h,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 140.h,
                                          width: 130.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    sofaList[index].icon),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Text(
                                          'Rating: ${sofaList[index].ratingscrore} / 5',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          sofaList[index].title,
                                          style: TextStyle(
                                              fontSize: 22.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Price: ${sofaList[index].price} Rs',
                                          style: TextStyle(
                                              fontSize: 19.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 120.w,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.r)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          sofaList[index].qty--;
                                                          context
                                                              .read<
                                                                  CalculateSumCubit>()
                                                              .showData(total);
                                                          calculateSum(sumList);
                                                          //context.read<CalculateSumCubit>().calculateSum(doubleSum);
                                                          //sumList.remove(totalPrice);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.remove_circle,
                                                        color: Colors.black,
                                                      )),
                                                  Text(
                                                      'Qty: ${sofaList[index].qty}'),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          sofaList[index].qty++;
                                                          context
                                                              .read<
                                                                  CalculateSumCubit>()
                                                              .showData(total);
                                                          calculateSum(sumList);
                                                          //context.read<CalculateSumCubit>().calculateSum(doubleSum);

                                                        });
                                                      },
                                                      child: const Icon(
                                                          Icons
                                                              .add_circle_rounded,
                                                          color: Colors.black))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              'Total Price: ${sofaList[index].totalPrice} Rs',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            //Text('Total sum: $sum'),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            var cartItem = sofaList[index];
                                            context.read<CartBloc>().add(
                                                RemoveProductEvent(cartItem));
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Positioned(
                                //     child: Text(sum.toString())
                                // )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(
                              height: 5.h,
                            ),
                        itemCount: state.cartItem.length),
                  )
                ],
              ));
        });
      },
    );
  }
}
