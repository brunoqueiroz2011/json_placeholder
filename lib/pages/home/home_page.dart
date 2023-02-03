import 'package:flutter/material.dart';
import 'package:json_placeholder/pages/home/components/header.dart';
import 'package:json_placeholder/pages/home/components/listPosts.dart';
import 'package:json_placeholder/utility/default.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderHome(size: size),
        const Padding(
          padding: EdgeInsets.only(left: Default.defaultPadding),
          child: Text(
            "Posts",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(Default.defaultPadding),
            child: ListPosts(),
          ),
        ),
      ],
    );
  }
}
