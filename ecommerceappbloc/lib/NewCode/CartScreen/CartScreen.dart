import 'package:ecommerceappbloc/bloc/calculateSum/calculate_sum_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/exports.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  var sumList= []; // contains all sums very long list
  var allSums; // iterated list and holds all sums which we need but this id dynamic list
  List<double> doubleSum = []; // converted list [from dynamic to double]
  var totalSum;

  double sum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //var sum = allSums.map((s) => s as double).toList();
  //var sum = allSums.fold(0, (previous, current) => previous + current);


  @override
  Widget build(BuildContext context) {
    //print(doubleSum);
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          List<SofaModel> sofaList = state.cartItem;


          void calculateSum(var list){
            Iterable inReverse = list.reversed;
            for(int i=0; i<inReverse.length; i++){
              allSums = inReverse.take(state.cartItem.length).toList();
              //print(allSums);
              doubleSum = allSums.cast<double>();
              print('Double Sum: $doubleSum');
              sum = doubleSum.fold(0, (p, c) => p + c);
              print('Sum: $sum');
              //print('Sum List: $doubleSum');
              // //sum = doubleSum.sum;
              // sum = doubleSum.fold(0, (p, c) => p + c);
              // print(sum);
            }
          }
          return BlocBuilder<CalculateSumCubit, CalculateSumState>(
              builder: (context, st){
                //context.read<CalculateSumCubit>().calculateSum(allSums);
                double total = st.sum;
                //total = sum;
                //st.sum = total;
                //calculateSum(sumList);
                return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Total items: ${sofaList.length}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25.r)
                            ),
                            child: Text('Pay now $total', style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
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
                                sofaList[index].totalPrice = sofaList[index].price * sofaList[index].qty;
                                sumList.add(sofaList[index].totalPrice); //[1,2, 3 4]
                                print(sumList);
                                //totalSum = sofaList[index].totalPrice;
                                //print('Total Sum:  $totalSum');
                                calculateSum(sumList);   //[5089.0, 7899.0]
                                //print(sofaList[index].totalPrice);
                                //print(sumList);

                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 15.h, left: 10.w, right: 15.w, bottom: 10.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0x10101014),
                                    borderRadius: BorderRadius.circular(30.r),

                                  ),
                                  height: 200.h,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 140.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(sofaList[index].icon),
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 120.w,
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(40.r)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                sofaList[index].qty --;
                                                                context.read<CalculateSumCubit>().calculateSum(doubleSum);
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
                                                                sofaList[index].qty ++;
                                                                context.read<CalculateSumCubit>().calculateSum(doubleSum);
                                                              });
                                                            },
                                                            child: const Icon(
                                                                Icons.add_circle_rounded,
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
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                  //Text('Total sum: $sum'),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              Icon(
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
                              itemCount: state.cartItem.length
                          ),
                        )
                      ],
                    )

                );
              }
          );
        }
    );
  }
}