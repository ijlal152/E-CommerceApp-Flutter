import 'package:ecommerceappbloc/presentation/Dashboard/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(24.r)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())),
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/icons/me.png'),
              radius: 24.r,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // const Text(
                  //   'Hi 👋',
                  //   style: TextStyle(
                  //     color: Color(0xFF757575),
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  SizedBox(height: 6.h),
                  Text(
                    user.email!,
                    style: TextStyle(
                      color: const Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 28.h,
            icon: Image.asset('assets/icons/notification.png'),
            onPressed: () {},
          ),
          SizedBox(width: 16.w),
          IconButton(
            iconSize: 28.h,
            icon: Image.asset('assets/icons/light/heart@2x.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
