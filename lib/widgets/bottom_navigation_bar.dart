import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromRGBO(20, 39, 86, 1), // set background color
      selectedItemColor: Colors.white, // set selected item color
      unselectedItemColor:
          Color.fromRGBO(157, 145, 254, 1), // set unselected item color
      selectedFontSize: 18, // set selected item font size
      unselectedFontSize: 14, // set unselected item font size
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              currentIndex == 1
                  ? Colors.white
                  : Color.fromARGB(255, 158, 145, 255),
              BlendMode.srcIn,
            ),
            child: Image.asset(
              'assets/images/static.png',
              width: 28,
              height: 28,
            ),
          ),
          label: 'Static',
        ),
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              currentIndex == 2
                  ? Colors.white
                  : Color.fromARGB(255, 158, 145, 255),
              BlendMode.srcIn,
            ),
            child: Image.asset(
              'assets/images/spaceship.png',
              width: 28,
              height: 28,
            ),
          ),
          label: 'Spaceship',
        ),
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              currentIndex == 3
                  ? Colors.white
                  : Color.fromARGB(255, 158, 145, 255),
              BlendMode.srcIn,
            ),
            child: Image.asset(
              'assets/images/setting.png',
              width: 28,
              height: 28,
            ),
          ),
          label: 'Setting',
        ),
      ],
    );
  }
}
