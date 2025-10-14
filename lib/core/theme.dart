import 'package:flutter/material.dart';

class AppTheme {
  static final primaryColorLight = fromHex('#80FF72');
  static final secondaryColorLight = fromHex('#197278');
  static final onSecondaryLight = fromHex('#F4FAFF');
  static final onPrimaryLight = fromHex('#08090A');
}

Color fromHex(String hex) {
  hex = hex.replaceAll('#', '');
  hex = 'FF$hex';
  return Color(int.parse(hex,radix: 16));
}
