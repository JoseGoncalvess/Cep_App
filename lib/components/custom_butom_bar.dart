import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cep_app/helpers/enum_icon_tab.dart';
import 'package:flutter/material.dart';

class CustomButomBar extends StatelessWidget {
  final int activeIndex;
  final Function({required int index}) ontap;
  const CustomButomBar(
      {super.key, required this.activeIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 2,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              EnumIconTab.values.map((e) => e.icon).toList()[index],
              size: 24,
              color: isActive ? Colors.amber : const Color(0xCEFFFFFF),
            ),
            const SizedBox(height: 4),
            Text(
              EnumIconTab.values.map((e) => e.description).toList()[index],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.amber : const Color(0xCEFFFFFF),
              ),
            )
          ],
        );
      },
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      notchSmoothness: NotchSmoothness.softEdge,
      height: MediaQuery.of(context).size.height * 0.08,
      hideAnimationCurve: Curves.slowMiddle,
      elevation: 1,
      onTap: (int index) {
        ontap(index: index);
      },
    );
  }
}
