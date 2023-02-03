import 'package:flutter/material.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/utility/default.dart';
import 'package:json_placeholder/utility/web_service.dart';

class PostCards extends StatefulWidget {
  PostCards({
    required this.post,
    super.key,
  });

  final Post post;
  late String title = "", body = "";

  @override
  State<PostCards> createState() => _PostCardsState();
}

class _PostCardsState extends State<PostCards> {
  void createPost(Post post) async {
    var ws = WebServiceAPI();

    Post newPost = await ws.createPost();

    setState(() {
      widget.title = newPost.title.toString();
      widget.body = newPost.body.toString();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Post Criado com Sucesso!")));
    });
  }

  void updatingPost(Post post) async {
    var ws = WebServiceAPI();

    Post newPost = await ws.updatingPost(post);

    if (newPost.title.toString().isNotEmpty) {
      setState(() {
        widget.title = newPost.title.toString();
        widget.body = newPost.body.toString();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Post Atualizado com Sucesso!")));
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erro ao tentar Atualizado!")));
    }
  }

  void patchingPost(Post post) async {
    var ws = WebServiceAPI();

    Post newPost = await ws.patchingPost(post);
    if (newPost.title.toString().isNotEmpty) {
      setState(() {
        widget.title = newPost.title.toString();
        widget.body = newPost.body.toString();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Post Atualizado com Sucesso!")));
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erro ao tentar Atualizado!")));
    }
  }

  void deletingPost(Post post) async {
    var ws = WebServiceAPI();

    String response = await ws.deletingPost(post);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response)));
  }

  _showMyDialog(BuildContext context, Post post) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.body),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 15),
                          label: const Text("Post"),
                          onPressed: () => createPost(post),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.refresh, size: 15),
                          label: const Text("Put"),
                          onPressed: () => updatingPost(post),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.refresh, size: 15),
                          label: const Text("Patch"),
                          onPressed: () => patchingPost(post),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.delete, size: 15),
                          label: const Text("Delete"),
                          onPressed: () => deletingPost(post),
                        ),
                      ],
                    )
                  ],
                ),
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

  _callDialog(BuildContext context, Post post) {
    widget.title = post.title.toString();
    widget.body = post.body.toString();
    _showMyDialog(context, widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Default.defaultPadding * 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _callDialog(context, widget.post),
            child: Container(
              padding: const EdgeInsets.all(Default.defaultPadding * 0.3),
              decoration: BoxDecoration(
                color: Default.getcolorDigits,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Default.getcolorDefault.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.id.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.post.title.toString(),
                    style: const TextStyle(
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
}
