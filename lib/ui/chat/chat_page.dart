import 'package:chat_app/model/chat.dart';
import 'package:chat_app/ui/chat/my_chat_item.dart';
import 'package:chat_app/ui/chat/other_chat_item.dart';
import 'package:chat_app/viewmodel/chat_view_model.dart';
import 'package:chat_app/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final myEmail = 'bbb@aaa.com';

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // provider로부터 데이터를 한번 읽어 온다.
    context.read<ChatViewModel>().fetch();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
              onPressed: () => context.read<LoginViewModel>().logout(),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: viewModel.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewModel.chatList.length,
                      itemBuilder: (context, index) {
                        Chat chat = viewModel.chatList[index];
                        if (myEmail == chat.email) {
                          return MyChatItem(chat: chat);
                        } else {
                          return OtherChatItem(chat: chat);
                        }
                      },
                    ),
            ),
            Column(
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Message를 입력하세요',
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.email),
                    ),
                    Flexible(child: Container()),
                    TextButton(
                      onPressed: () {
                        viewModel.pushMessage(myEmail, _controller.text,
                            DateTime.now().millisecond
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text(
                          'SEND',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
