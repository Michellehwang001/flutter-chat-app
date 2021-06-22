import 'package:chat_app/model/chat.dart';

abstract class Repository<T> {
  Future<List<T>> getAll();
  Future add(T item);
}