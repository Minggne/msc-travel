class Post {
  final String id;
  final String content;
  final int likes;
  final int shares;

  Post({required this.id, required this.content, required this.likes, required this.shares});

  // Phương thức chuyển từ JSON thành đối tượng Post
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      content: json['content'],
      likes: json['likes'],
      shares: json['shares'],
    );
  }
}
