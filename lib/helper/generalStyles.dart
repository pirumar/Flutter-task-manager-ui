import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

GeneralStyles get generalStyles => GeneralStyles.instance;

class GeneralStyles {
  static GeneralStyles _instance;
  static GeneralStyles get instance {
    if (_instance == null) {
      _instance = GeneralStyles._init();
    }
    return _instance;
  }

  GeneralStyles._init();
  static const Color black = Color(0xFF22283e);
  TextStyle textStyleH1 = GoogleFonts.openSans(
    fontSize: 18,
    color: black,
  );

  TextStyle textStyleH1Bold = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: black,
  );
  TextStyle textStyleH2 = GoogleFonts.openSans(
    fontSize: 14,
    color: black,
  );
  TextStyle textStyleH2Bold = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: black,
  );
  TextStyle textStyleH3 = GoogleFonts.openSans(
    fontSize: 12,
    color: black,
  );
  TextStyle textStyleH3Bold = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: black,
  );
  TextStyle getStyle(TextStyle style, {color, size, weight, spacing, height}) {
    return GoogleFonts.openSans(
      textStyle: style,
      color: color ?? style.color,
      fontSize: size ?? style.fontSize,
      fontWeight: weight ?? style.fontWeight,
      letterSpacing: spacing ?? .1,
      height: height ?? 1,
    );
  }
}
