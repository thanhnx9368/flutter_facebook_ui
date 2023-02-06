import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook/constants/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function onTap;
  final int tabIndex;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.onTap,
      required this.tabIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        padding: const EdgeInsets.only(bottom: 8),
        onTap: (value) => onTap(value),
        indicatorColor: Palette.facebookBlue,
        indicator: const BoxDecoration(
            border:
                Border(top: BorderSide(color: Palette.facebookBlue, width: 3))),
        tabs: icons
            .asMap()
            .map((key, value) => MapEntry(
                key,
                Tab(
                    icon: Icon(value,
                        color: key == tabIndex
                            ? Palette.facebookBlue
                            : Colors.black45,
                        size: 30))))
            .values
            .toList());
  }
}
