import 'package:flutter/material.dart';
import 'package:json_placeholder/pages/home/home_page.dart';
import 'package:json_placeholder/utility/default.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const HomePage(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Default.getcolorDefault,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => _showMyDialog(context),
          icon: const Icon(Icons.info),
        )
      ],
    );
  }

  _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('{JSON} Placeholder'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'When to use.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "JSONPlaceholder is a free online REST API that you can use whenever you need some fake data. It can be in a README on GitHub, for a demo on CodeSandbox, in code examples on Stack Overflow, ...or simply to test things locally."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
