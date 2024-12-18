import 'post.dart'; // Import lớp Model
import 'facebook_api.dart'; // Giả sử có file quản lý API Facebook

class PostController {
  final FacebookApi _api = FacebookApi();

  // Phương thức lấy dữ liệu top 10 bài viết có nhiều lượt like nhất
  Future<List<Post>> getTop10Likes() async {
    List<Post> posts = await _api.fetchPosts();
    posts.sort((a, b) => b.likes.compareTo(a.likes)); // Sắp xếp theo lượt like giảm dần
    return posts.take(10).toList();
  }

  // Phương thức lấy dữ liệu top 10 bài viết có nhiều lượt share nhất
  Future<List<Post>> getTop10Shares() async {
    List<Post> posts = await _api.fetchPosts();
    posts.sort((a, b) => b.shares.compareTo(a.shares)); // Sắp xếp theo lượt share giảm dần
    return posts.take(10).toList();
  }
}
