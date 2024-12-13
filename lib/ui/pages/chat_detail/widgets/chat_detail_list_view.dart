import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/chat_global_view_model.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_receive_item.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_send_item.dart';
import 'package:flutter_market_app/ui/user_global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final chatRoom = ref.watch(chatGlobalViewModel).chatRoom;
      if (chatRoom == null) {
        return SizedBox();
      }
      final messages = chatRoom.messages;
      final user = ref.watch(userGlobalViewModel)!;
      return Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            final msgSender = message.messageType == 'SENDER_TO_PRODUCT_OWNER'
                ? chatRoom.sender
                : chatRoom.product.user;
            if (user.id == msgSender) {
              return ChatDetailSendItem(
                  content: message.content, dateTime: message.createdAt);
            }
            bool showProfile = true;
            if (index > 0) {
              final previousMsg = messages[index - 1];
              showProfile = previousMsg.messageType != message.messageType;
            }
            return ChatDetailReceiveItem(
              imageUrl: msgSender.profile.url,
              showProfile: showProfile,
              content: message.content,
              dateTime: message.createdAt,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 4,
            );
          },
        ),
      );
    });
  }
}
