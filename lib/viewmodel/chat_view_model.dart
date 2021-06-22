import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/fake_repository.dart';
import 'package:chat_app/repository/repository.dart';
import 'package:flutter/foundation.dart';

class ChatViewModel extends ChangeNotifier{
  final Repository<Chat> repository;

  ChatViewModel(this.repository);

  List<Chat> _chatList = [];

  List<Chat> get chatList => _chatList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // chatList 데이터를 가져온다.
  void fetch() {
    // 데이터 로딩 중.
    _isLoading = true;

    repository.getAll().then((value) {
      _chatList = value;
      // 데이터 로딩 완료
      _isLoading = false;
      notifyListeners();
    });
  }

  void pushMessage(String email, String message, int time) {
    repository.add(
      Chat(
        '황혜정',
        'https://yt3.ggpht.com/ytc/AAUvwniqTHfAb4NIjTwa5_G1BQmABidGaQ5SZc3AzOQF=s900-c-k-c0x00ffffff-no-rj',
        message,
        time,
        email,
      )
    ).whenComplete(() {
      notifyListeners();
    });
  }
}