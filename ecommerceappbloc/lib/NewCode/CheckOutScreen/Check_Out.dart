import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappbloc/NewCode/Models/checkout_model.dart';
import 'package:ecommerceappbloc/bloc/checkOut_bloc/order_bloc.dart';
import 'package:ecommerceappbloc/data/repositories/checkout_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/exports.dart';

class CheckOutScreen extends StatefulWidget {
  final double subTotal;
  //final List<String> imgs;
  final List<String> productName;
  const CheckOutScreen({Key? key, required this.subTotal, required this.productName,  }) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState(subTotal: subTotal);
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  double subTotal;
  _CheckOutScreenState({required this.subTotal});

  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final zipCode = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //CheckOutModel checkOutModel = CheckOutModel();

  double deliveryCharges = 10;
  double sum = 0;

  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    sum = subTotal + deliveryCharges;
    super.initState();
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNo.dispose();
    address.dispose();
    city.dispose();
    zipCode.dispose();
    super.dispose();
  }

  List checkOutData = [];
  List<String> checkOutStringData = [];
  List titlesOfProduct = [];
  String productNamesInString = '';

  final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var testVariable = BlocProvider.of<CartBloc>(context).state.cartItem;
    print(testVariable[0].title);
    print(testVariable[1].title);

    for(int i=0; i < testVariable.length ; i++){
      titlesOfProduct.add(testVariable[i].title);
      checkOutData = titlesOfProduct.take(testVariable.length).toList();
      //titlesOfProduct.clear();
    }
    //List<String> checkOutStringData;
    checkOutStringData = checkOutData.cast<String>();
    var newData = checkOutStringData.join(', ');
    //print(newData);
    //print('Checkout Data: $checkOutData');
    //print('String Data: $checkOutStringData');
    // print('Titles of Products: $titlesOfProduct');

    //BlocProvider.of<CartBloc>(context).state.cartItem.add(CartEvent as SofaModel);
    return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      List<SofaModel> product = state.cartItem;
      return Scaffold(
        key: _Scaffoldkey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Checkout', style: TextStyle(
            color: Colors.black
          ),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CUSTOMER INFORMATION', style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Full Name'),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: buildTextFormField('e.g: Muhammad Ali', fullName)
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Phone no'),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: buildTextFormField('e.g 03055210677', phoneNo),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h,),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DELIVERY INFORMATION', style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('Address'),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: buildTextFormField('e.g: Street no 3 Rwp', address)
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('City'),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: buildTextFormField('e.g: Rawalpindi', city)
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('ZIP Code'),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: buildTextFormField('e.g: 42503', zipCode)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50.h,),

                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => Container(
                            decoration: BoxDecoration(
                              color: const Color(0x10101014),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80.h,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(product[index].icon ))
                                  ),
                                ),
                                Center(child: Text(product[index].title, style: const TextStyle(
                                  fontWeight: FontWeight.w500
                                ),),)
                              ],
                            ),
                          ),
                          separatorBuilder: (_, index) => SizedBox(width: 5.w,) ,
                          itemCount: product.length
                      ),
                    ),


                    SizedBox(height: 40.h,),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ORDER SUMMARY', style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold
                          ),),

                          const Divider(thickness: 2,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('SUB TOTAL', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('$subTotal', style: const TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('DELIVERY FEE', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('10.00 Rs', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('TOTAL AMOUNT', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('$sum Rs', style: const TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              addSubCollectionCheckOut();
                              // BlocProvider.of<OrderBloc>(context)
                              //     .add(AddOrderEvent(fullName.text, phoneNo.text,
                              //     address.text, city.text, zipCode.text, sum, productNamesInString
                              // ));
                            },
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.r)
                                ),

                                child: const Text('CONFIRM ORDER', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
      );
    },
);
  }

  Widget buildTextFormField(String hinttext, TextEditingController controller){
    return TextFormField(
      controller: controller,
        validator: (value){
          if(value!.isEmpty){
            return 'Enter required data';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                )
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                )
            ),
            contentPadding: EdgeInsets.only(
                left: 2.w, top: 15.h, right: 2.w, bottom: 0.h
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 15.sp
            )

        )
    );
  }

  Future<void> addSubCollectionCheckOut() async{
    User? user = _firebaseAuth.currentUser;
    //print("Current User ID is: ${FirebaseAuth.instance.currentUser!.uid}");
    // 0izPviPIHve57bwppLfKURCHPUE3

    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      setState(() {
        loading = true;
      });
      User? user = _firebaseAuth.currentUser;
      CheckOutModel checkOutModel = CheckOutModel(
          fullName: fullName.text,
          phoneNo: phoneNo.text,
          address: address.text,
          city: city.text,
          zipCode: zipCode.text,
          totalAmount: sum,
          productName: productNamesInString
      );
      try{
        await firebaseFirestore.collection('UserTable')
            .doc(user!.uid)
            .collection('checkOut')
            .add(checkOutModel.toMap()).then(
              (value) => Fluttertoast.showToast(msg: "Order has been placed"),
        );
        //print(firebaseFirestore.collection('UserTable').doc(user.uid));
        //Firestore.instance.collection("board").document(doc_id).collection("Dates").document();
        setState(() {
          loading = false;
        });
      }on FirebaseException catch(e){
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(msg: e.toString());
      } catch (e){
        throw Exception(e.toString());
      }
    }
  }
}
