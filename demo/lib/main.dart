import 'package:flutter/material.dart';
import 'post_controller.dart';
import 'post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Analytics',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostListScreen(),
    );
  }
}

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final PostController _controller = PostController();
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _controller.getTop10Likes(); // Lấy top 10 bài viết có nhiều like nhất
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 10 Facebook Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu'));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.content),
                subtitle: Text('Likes: ${post.likes}, Shares: ${post.shares}'),
              );
            },
          );
        },
      ),
    );
  }
}
