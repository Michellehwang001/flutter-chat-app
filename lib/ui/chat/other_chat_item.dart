import 'package:chat_app/model/chat.dart';
import 'package:chat_app/util/date_util.dart';
import 'package:flutter/material.dart';

class OtherChatItem extends StatelessWidget {
  final Chat chat;

  const OtherChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: chat.profileUrl != null
                ? NetworkImage(chat.profileUrl!)
                : NetworkImage(
                    'http://ojsfile.ohmynews.com/STD_IMG_FILE/2012/0712/IE001463350_STD.jpg'),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      chat.name,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    Text(dateMillisecondsToString(chat.time)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(chat.message),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

