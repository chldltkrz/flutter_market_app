import 'package:flutter_market_app/data/model/user.dart';
import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 만들기 FileModel 클래스를 상태 클래스로 사용

// 2. 뷰모델 만들기
class UserGlobalViewModel extends Notifier<User?> {
  @override
  User? build() {
    // TODO: implement build
    fetchUserInfo();
    return null;
  }

  final userRepository = UserRepository();
  Future<void> fetchUserInfo() async {
    final user = await userRepository.myInfo();
    state = user;
  }
}

// 3. 뷰모델 관리자 만들기
final userGlobalViewModel = NotifierProvider<UserGlobalViewModel, User?>(() {
  return UserGlobalViewModel();
});
