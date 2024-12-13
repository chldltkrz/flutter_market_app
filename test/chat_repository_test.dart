import 'package:flutter_market_app/data/repository/chat_repository.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRepo = UserRepository();
  final chatRepor = ChatRepository();
  test('chatRoom Test', () async {
    final result1 = await chatRepor.list();
    expect(result1 == null, true);

    await userRepo.login(username: 'tester', password: '1111');
    final result2 = await chatRepor.list();
    expect(result2 != null, true);

    for (var v in result2!) {
      print(v.toJson());
    }
  });

  test('chatdetail Test', () async {
    await userRepo.login(username: 'tester', password: '1111');
    final result = await chatRepor.detail(1);
    expect(result != null, true);
    print(result?.toJson());
  });
}
