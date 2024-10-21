
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/camo/text.dart';

List<DropdownMenuItem<dynamic>>? items = [
  const DropdownMenuItem(child: Icon(Icons.camera)),
  const DropdownMenuItem(
    child: Icon(Icons.flash_on),
  )
];

List<CameraDescription> _cameras = [];
List<CameraDescription> getCameras() {
  return _cameras;
}

List<DropdownMenuItem<String>> listDropDown = [
  DropdownMenuItem(
      value: 'English',
      child: text("English", color: Colors.black, weight: FontWeight.bold)),
  DropdownMenuItem(
      value: 'తెలుగు',
      child: text("తెలుగు", color: Colors.black, weight: FontWeight.bold)),
  DropdownMenuItem(
      value: 'हिंदी',
      child: text("हिंदी", color: Colors.black, weight: FontWeight.bold)),
  DropdownMenuItem(
      value: 'ಕನ್ನಡ',
      child: text("ಕನ್ನಡ", color: Colors.black, weight: FontWeight.bold)),
  DropdownMenuItem(
      value: 'தமிழ்',
      child: text("தமிழ்", color: Colors.black, weight: FontWeight.bold)),
  DropdownMenuItem(
      value: 'മലയാളം',
      child: text("മലയാളം", color: Colors.black, weight: FontWeight.bold)),
];
