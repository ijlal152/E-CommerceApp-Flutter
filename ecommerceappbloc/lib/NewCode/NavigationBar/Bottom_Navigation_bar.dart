import 'package:ecommerceappbloc/NewCode/CartScreen/CartScreen.dart';
import 'package:ecommerceappbloc/NewCode/HomeScreen/HomeScreen.dart';
import 'package:ecommerceappbloc/NewCode/OrderScreen/OrderScreen.dart';
import 'package:ecommerceappbloc/NewCode/WalletScreen/WalletScreen.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItems {
  final String lightIcon;
  final String boldIcon;
  final String label;

  TabItems({required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      //icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      icon: const Icon(Icons.abc),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {

  int _select = 0;

  final screens = [
    HomeScreen(),
    CartScreen(),
    const OrderScreen(),
    const WalletScreen(),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Home@2x.png',  ),
      activeIcon: Image.asset('assets/icons/tabbar/bold/Home@2x.png'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Bag@2x.png'),
      activeIcon: Image.asset('assets/icons/tabbar/bold/Bag@2x.png'),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Buy@2x.png'),
      activeIcon: Image.asset('assets/icons/tabbar/bold/Buy@2x.png'),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Wallet@2x.png'),
      activeIcon: Image.asset('assets/icons/tabbar/bold/Wallet@2x.png'),
      label: 'Wallet',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Profile@2x.png'),
      activeIcon: Image.asset('assets/icons/tabbar/bold/Profile@2x.png'),
      label: 'Profile',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r)
          )
        ),
        child: BottomNavigationBar(
          items: items,
          onTap: ((value) => setState(() => _select = value)),
          currentIndex: _select,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
          ),
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 10.sp,
          ),
          selectedItemColor: const Color(0xFF212121),
          unselectedItemColor: const Color(0xFF9E9E9E),
        ),
      ),
    );
  }
}
