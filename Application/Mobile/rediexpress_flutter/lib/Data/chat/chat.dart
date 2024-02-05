// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rediexpress_flutter/Data/message/message.dart';

class Chat {
  final String name;
  List<Message> Messages = [];
  final int unreadedcount;
  Chat({
    required this.name,
    required this.unreadedcount,
  });
}
