import 'package:flutter/material.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/utility/default.dart';

class PostCards extends StatelessWidget {
  const PostCards({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Default.defaultPadding * 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _showMyDialog(context, post),
            child: Container(
              padding: const EdgeInsets.all(Default.defaultPadding * 0.3),
              decoration: BoxDecoration(
                color: Default.getcolorDigits,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Default.getcolorDefault.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.id.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post.title.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showMyDialog(BuildContext context, Post post) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(post.title.toString()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(post.body.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
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
