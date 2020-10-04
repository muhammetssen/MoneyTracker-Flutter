import 'package:flutter/material.dart';
class TextStyles {
  static const input = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
  );
    static const button = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const inputError = const TextStyle(
    // color: PAColors.red,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );

    static const info = const TextStyle(
    // color: const Color(0x8f1d1d26),
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
  );
   static const infoClickable = const TextStyle(
    color: const Color(0xffe9446a),
    fontWeight: FontWeight.w400,
    fontSize: 13.0,
  );
}


class Decorations {
  static final input = InputDecoration(
    labelStyle: TextStyles.input,
    errorStyle: TextStyles.inputError,
  );
}