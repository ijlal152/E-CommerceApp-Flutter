import 'package:ecommerceappbloc/presentation/Dashboard/homescreen.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/profile_screen.dart';
import 'package:ecommerceappbloc/presentation/bottomnavscreens/TestScreen.dart';
import 'package:ecommerceappbloc/presentation/cart/cartScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TabbarItem {
  final String lightIcon;
  final String boldIcon;
  final String label;

  TabbarItem({required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      //icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      icon: Icon(Icons.abc),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class FBTabbarScreen extends StatefulWidget {
  const FBTabbarScreen({Key? key}) : super(key: key);

  @override
  State<FBTabbarScreen> createState() => _FBTabbarScreenState();
}

class _FBTabbarScreenState extends State<FBTabbarScreen> {

  int _select = 0;

  final screens = [
    const HomeScreen(
      //title: '首页0',
    ),
    //const TestScreen(title: 'Cart'),
    const CartScreen(),
    const TestScreen(title: 'Orders'),
    const TestScreen(title: 'Wallet'),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/icons/tabbar/light/Home@2x.png'),
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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Email: \n ${user.email}',
      //     style: const TextStyle(fontSize: 24),
      //     textAlign: TextAlign.center,
      //   ),
      //   actions: [
      //     Icon(Icons.logout)
      //   ],
      // ),
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        selectedItemColor: const Color(0xFF212121),
        unselectedItemColor: const Color(0xFF9E9E9E),
      ),
    );
  }
}
