import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/repository.dart';

class FakeRepository extends Repository {
  // items 변수로 뺀다.
  final List<Chat> items = [
    Chat('홍길동', null, 'hello world', 100234234234, 'aaa@aaa.com'),
    Chat(
        '홍길동',
        null,
        'hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2',
        100234234234,
        'aaa@aaa.com'),
    Chat('한석봉', null, 'hello world 3hello world 3hello', 100234234234, 'bbb@aaa.com'),
  ];

  @override
  Future<List<Chat>> getChatList() async {
    await Future.delayed(Duration(seconds: 1));
    return items;
  }

  @override
  Future pushMessage(String email, String message) async {
    // 서버연결 효과를 위해 잠시 delay 시킨다.
    await Future.delayed(Duration(milliseconds: 10));

    // 서버에서 name, profileUrl 얻어야 함.
    items.add(Chat('황혜정', 'https://t1.daumcdn.net/cfile/tistory/993823505A6C0BD432', message, DateTime.now().millisecondsSinceEpoch, email));
    print('${items.length}');
  }
}
