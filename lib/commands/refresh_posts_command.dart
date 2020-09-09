import 'base_command.dart';

class RefreshPostsCommand extends BaseCommand {

  Future<List<String>> run(String user) async {
    // Make service call and inject rersults into the model
    List<String> posts = await userService.getPosts(user);
    userModel.userPosts = posts;

    // Return our posts to the caller in case they care
    return posts;
  }
  
}
