import 'base_command.dart';
import 'refresh_posts_command.dart';

class LoginCommand extends BaseCommand {

  Future<bool> run(String user, String pass) async {
    // Await some service call
    bool loginSuccess = await userService.login(user, pass);

    // Run a 2nd command if service call was successful
    if (loginSuccess) {
      await RefreshPostsCommand().run(user);
      // Update appModel with current user. Any views bound to this will rebuild
      appModel.currentUser = loginSuccess? user : null;
    }


    // Return the result to whoever called us, in case they care
    return loginSuccess;
  }
  
}
