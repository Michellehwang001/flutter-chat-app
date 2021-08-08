import 'package:chat_app/model/chat.dart';
import 'package:chat_app/repository/firebase/firestore_chat_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('firestore 테스트', () async {
    final repository = FirestoreChatRepository(firebaseFirestore: FakeFirebaseFirestore());

    // add 테스트
    await repository.add(Chat('test', 'https://t1.daumcdn.net/cfile/tistory/99844E4A5E5E2C9D29', 'message..', 123, 'aaa@test.com'));

    // getAll() 테스트
    expect((await repository.getAll()).length, 1);

    // Stream<QuerySnapshot<Chatp>> getCharRef() 테스트
    // expect((await repository.getChatRef().length), 1);

  });
}