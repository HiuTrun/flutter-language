import 'package:Medication_App/widgets/button_nav_item.dart';
import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: 'Today',
            svgScr: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: 'All Exercises',
            svgScr: "assets/icons/gym.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: 'Settings',
            svgScr: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}
