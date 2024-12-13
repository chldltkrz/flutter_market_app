import 'package:flutter_market_app/data/model/chat_room.dart';
import 'package:flutter_market_app/data/repository/base_remote_repository.dart';

class ChatRepository extends BaseRemoteRepository {
  Future<List<ChatRoom>?> list() async {
    final response = await client.get('/api/chat/room/list');
    if (response.statusCode == 200) {
      final content = response.data['content'];
      return List.from(content).map((e) {
        return ChatRoom.fromJson(e);
      }).toList();
    }
    return null;
  }

  Future<ChatRoom?> detail(int roomId) async {
    final response = await client.get('/api/chat/room/$roomId');
    if (response.statusCode == 200) {
      final content = response.data['content'];
      return ChatRoom.fromJson(response.data['content']);
    }
    return null;
  }

  Future<ChatRoom?> create(int productId) async {
    final response = await client.post('/api/chat/room/make/$productId');
    if (response.statusCode == 201) {
      return ChatRoom.fromJson(response.data['content']);
    }
    return null;
  }
}
