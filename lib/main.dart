import 'package:chat_app/ui/chat/chat_page.dart';
import 'package:chat_app/ui/login/login_page.dart';
import 'package:chat_app/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: LoginViewModel(),)
    ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: viewModel.isLogin ? ChatPage() : LoginPage(),
    );
  }
}

