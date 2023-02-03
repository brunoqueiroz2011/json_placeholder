import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_placeholder/models/post.dart';
import 'package:json_placeholder/utility/default.dart';

class WebServiceAPI {
  var bodyResponse;
  List<Post> listPosts = [];
  var url = Uri.https(Default.urlBase, Default.pathPosts);

  Future<List<Post>> getAllPosts() async {
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

  Future<Post> createPost() async {
    var url = Uri.https(Default.urlBase, Default.pathPosts);

    Post post = Post(
        userId: 1,
        id: 120,
        title: "New Post Add!!!",
        body: "laudantium enim quasi est quidem magnam voluptate");

    var body = jsonEncode(post.toJson());

    http.Response response = await http.post(url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: body);

    if (response.statusCode == 201) {
      bodyResponse = json.decode(response.body);
      post = Post(
          userId: bodyResponse["userId"],
          id: bodyResponse["id"],
          title: bodyResponse["title"],
          body: bodyResponse["body"]);
    }

    return post;
  }

  Future<Post> updatingPost(Post post) async {
    var url = Uri.https(Default.urlBase, "${Default.pathPosts}/${post.id}");

    post.title = "Post Updating!!!";
    post.body = "Conteudo todo atualizado com muito sucesso!!!";

    var body = jsonEncode(post.toJson());

    http.Response response = await http.put(url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: body);

    if (response.statusCode == 200) {
      bodyResponse = json.decode(response.body);
      post = Post(
          userId: bodyResponse["userId"],
          id: bodyResponse["id"],
          title: bodyResponse["title"],
          body: bodyResponse["body"]);
    } else {
      post = new Post();
    }

    return post;
  }

  Future<Post> patchingPost(Post post) async {
    var url = Uri.https(Default.urlBase, "${Default.pathPosts}/${post.id}");

    post.title = "Post Patching!!!";
    post.body = "Conteudo Parcialmente atualizado com muito sucesso!!!";

    var body = jsonEncode(post.toJson());

    http.Response response = await http.patch(url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: body);

    if (response.statusCode == 200) {
      bodyResponse = json.decode(response.body);
      post = Post(
          userId: bodyResponse["userId"],
          id: bodyResponse["id"],
          title: bodyResponse["title"],
          body: bodyResponse["body"]);
    } else {
      post = new Post();
    }

    return post;
  }

  Future<String> deletingPost(Post post) async {
    String result = "";
    var url = Uri.https(Default.urlBase, "${Default.pathPosts}/${post.id}");
    http.Response response = await http.delete(url);
    if (response.statusCode == 200) {
      result = "Deletado com Sucesso!!!";
    } else {
      result = "Erro ao tentar atualizar!!!";
    }
    return result;
  }
}
