// 1. 상태 클래스
import 'package:flutter_market_app/data/model/chat_room.dart';
import 'package:flutter_market_app/data/repository/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatGlobalState {
  List<ChatRoom> chatRooms;
  ChatRoom? chatRoom;
  ChatGlobalState({
    required this.chatRooms,
    required this.chatRoom,
  });

  ChatGlobalState copyWith({
    List<ChatRoom>? chatRooms,
    ChatRoom? chatRoom,
  }) {
    return ChatGlobalState(
      chatRooms: chatRooms ?? this.chatRooms,
      chatRoom: chatRoom ?? this.chatRoom,
    );
  }
}

// 2. 뷰모델 클래스
class ChatGlobalViewModel extends Notifier<ChatGlobalState> {
  @override
  ChatGlobalState build() {
    return ChatGlobalState(
      chatRooms: [],
      chatRoom: null,
    );
  }

  final chatRepository = ChatRepository();
  Future<void> fetchList() async {
    final result = await chatRepository.list();
    if (result != null) {
      state = state.copyWith(
        chatRooms: result,
      );
    }
  }

  Future<void> fetchChatDetail(int roomId) async {
    final result = await chatRepository.detail(roomId);
    if (result != null) {
      state = state.copyWith(
        chatRoom: result,
      );
    }
  }

  Future<int?> createChat(int productId) async {
    final result = await chatRepository.create(productId);
    if (result != null) {
      state = state.copyWith(
        chatRooms: [result, ...state.chatRooms],
      );
      return result.roomId;
    }
    return null;
  }

  int? findChatRoomByProductId(int productId) {
    final target =
        state.chatRooms.where((e) => e.product.id == productId).toList();

    if (target.isNotEmpty) {
      return target.first.roomId;
    }
    return null;
  }
// 3. 뷰모델 관리자
}

final chatGlobalViewModel =
    NotifierProvider<ChatGlobalViewModel, ChatGlobalState>(() {
  return ChatGlobalViewModel();
});
