import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget text(String value, {Color? color, double? size, FontWeight? weight}) {
  return Text(value,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: color ?? Colors.black,
            fontSize: size ?? 20,
            fontWeight: weight ?? FontWeight.normal,
            decoration: TextDecoration.none),
      ));
}
