import 'package:chat_app/repository/firebase/firebase_user_repository.dart';
import 'package:chat_app/repository/firebase/firestore_chat_repository.dart';
import 'package:chat_app/ui/chat/chat_page.dart';
import 'package:chat_app/ui/login/login_page.dart';
import 'package:chat_app/viewmodel/chat_view_model.dart';
import 'package:chat_app/viewmodel/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final userRepository = FirebaseUserRepository();
  // final chatRepository = FirebaseChatRepository();

  final chatRepository = FirestoreChatRepository();

  // final userRepository = FakeUserRepository();
  // final chatRepository = FakeChatRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginViewModel(userRepository)),
        ChangeNotifierProvider.value(value: ChatViewModel(chatRepository)),
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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.amber),
        ),
      ),
      home: viewModel.user != null ? ChatPage() : LoginPage(),
    );
  }
}
