import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final IconData icon;
  const RoundButton({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width * .6,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30.r)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white,),
          SizedBox(width: 10.w,),
          Text(title, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp

          ),),
        ],
      ),
    );
  }
}
