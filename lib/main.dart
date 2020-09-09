import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'commands/base_command.dart' as Commands;
import 'models/app_model.dart';
import 'models/user_model.dart';
import 'services/user_service.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => AppModel()),
        ChangeNotifierProvider(create: (c) => UserModel()),
        Provider(create: (c) => UserService()),
      ],
      child: Builder(builder: (context) {
        // Save a context our Commands can use to access provided Models and Services
        Commands.init(context);
        return MaterialApp(home: AppScaffold());
      }),
    );
  }
}

class AppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Bind to AppModel.currentUser
    String currentUser = context.select<AppModel, String>((value) => value.currentUser);
    
    // Return the current view, based on the currentUser value:
    return Scaffold(
      body: currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
