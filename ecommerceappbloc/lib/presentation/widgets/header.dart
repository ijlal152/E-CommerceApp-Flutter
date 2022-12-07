import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            //onTap: () => Navigator.pushNamed(context, ProfileScreen.route()),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/me.png'),
              radius: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Hi 👋',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Abson He',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 28,
            icon: Image.asset('assets/icons/notification.png'),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 28,
            icon: Image.asset('assets/icons/light/heart@2x.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
