import 'dart:convert';
import 'post.dart';
import 'package:http/http.dart' as http;

class FacebookApi {
  final String _apiUrl = 'https://graph.facebook.com/me/posts?access_token=EAAZARlvgYRiEBOz6w9DkBU9ZACr6pRnWvUZC8rJNI8jp3iny2SfahxZCexfu2FXmwtkHVZBkkjh4CZBFg6tei8moXQCew8jtjYleppEZAZCkc07mZAYZA431XQDkIwZAcYRiU7J9eg7gKvQj8bm7tSrKk6ZCkS0dlVB7BkwZBd1rvQt8anYoIP7ZCgLmFyhEhW4JPNAWbbF5Aym1OqRfVPGgpdWgZDZD';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
