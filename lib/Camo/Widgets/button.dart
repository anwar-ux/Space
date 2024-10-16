import 'package:flutter/material.dart';

// Widget button(
//     {IconData? icon,
//     Image? image,
//     void Function()? onPressed,
//     Color? color,
//     Color? bgcolor}) {
//   return FloatingActionButton.small(
//       heroTag: null,
//       backgroundColor: bgcolor ?? const Color.fromARGB(100, 255, 255, 255),
//       onPressed: onPressed,
//       child: image ??
//           Icon(
//             icon,
//             color: color ?? bgcolor,
//           ));
// }
Widget button(
    {IconData? icon,
    Image? image,
    void Function()? onPressed,
    Color? color,
    Color? bgcolor}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
            color: bgcolor ?? const Color.fromARGB(100, 255, 255, 255),
            borderRadius: BorderRadius.circular(12)),
        child: image ??
            Icon(
              icon,
              color: color ?? bgcolor,
            )),
  );
}
