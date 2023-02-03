import 'package:flutter/material.dart';
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/pages/home/components/PostCard.dart';
import 'package:json_placeholder/utility/web_service.dart';

class ListPosts extends StatefulWidget {
  const ListPosts({super.key});

  @override
  State<ListPosts> createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  final loading = ValueNotifier<bool>(false);

  Future<List<Post>> generateVerse() async {
    var ws = WebServiceAPI();
    return await ws.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: generateVerse(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Houve algum error na requisição")));
              return Text("Houve algum error na requisição");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post post = snapshot.data![index];
                  return PostCards(post: post);
                },
              );
            }
            break;
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
