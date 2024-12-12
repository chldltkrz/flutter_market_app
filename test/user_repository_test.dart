import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRepo = UserRepository();

  test('UserRepository Test', () async {
    final result1 = await userRepo.login(username: '1111', password: '1111');
    expect(result1, false);
    final result2 = await userRepo.login(username: 'tester', password: '1111');
    expect(result2, true);
  });

  test('UserRepository: NickNameCHeck', () async {
    final result1 = await userRepo.nicnnameCk('테스트');
    expect(result1, false);
    final result2 = await userRepo.nicnnameCk('qqqq');
    expect(result2, true);
  });
  test('UserRepository: UserNameHeck', () async {
    final result1 = await userRepo.usernameCk('tester');
    expect(result1, false);
    final result2 = await userRepo.usernameCk('qqqq');
    expect(result2, true);
  });

  test('UserRepository: UserInfoSearch', () async {
    final result = await userRepo.myInfo();
    expect(result == null, true);
    await userRepo.login(username: 'tester', password: '1111');
    final result2 = await userRepo.myInfo();
    expect(result2 == null, false);
    print(result2!.toJson());
  });
}
