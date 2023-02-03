import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/utility/default.dart';

class WebServiceAPI {
  var bodyResponse;
  List<Post> listPosts = [];

  Future<List<Post>> getAllPosts() async {
    var url = Uri.https(Default.urlBase, Default.pathPosts);

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      bodyResponse = json.decode(response.body);

      for (var item in bodyResponse) {
        Post post = Post(
            userId: item["userId"],
            id: item["id"],
            title: item["title"],
            body: item["body"]);
        listPosts.add(post);
      }
    } else {
      listPosts.add(Post(userId: 0, id: 0, title: "", body: ""));
    }

    return listPosts;
  }
}
