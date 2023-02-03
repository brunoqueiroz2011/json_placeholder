import 'package:flutter/material.dart';
import 'package:json_placeholder/pages/root_page.dart';
import 'package:json_placeholder/utility/default.dart';

void main() {
  runApp(MaterialApp(
    title: "JsonPlaceholder",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: Default.getcolorDefault,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    home: const RootPage(),
  ));
}
