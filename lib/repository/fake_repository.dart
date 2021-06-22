import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/repository.dart';

// abstract class Repository<T> 선언으로 인해  Repository<Chat> 으로 수정
class FakeRepository extends Repository<Chat> {
  // items 변수로 뺀다.
  final List<Chat> items = [
    Chat('홍길동', null, 'hello world', 100234234234, 'aaa@aaa.com'),
    Chat(
        '홍길동',
        null,
        'hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2hello world 2',
        100234234234,
        'aaa@aaa.com'),
    Chat('한석봉', null, 'hello world 3hello world 3hello', 100234234234,
        'bbb@aaa.com'),
  ];

  @override
  Future add(Chat item) async {
    await Future.delayed(Duration(milliseconds: 10));

    // 서버에서 name, profileUrl 얻어야 함.
    items.add(
        Chat(item.name, item.profileUrl, item.message, item.time, item.email));
  }

  @override
  Future<List<Chat>> getAll() async{
    await Future.delayed(Duration(milliseconds: 10));
    return items;
  }
}
